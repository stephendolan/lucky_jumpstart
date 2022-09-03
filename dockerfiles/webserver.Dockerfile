# Install the application Crystal dependencies
FROM crystallang/crystal:1.4.1-alpine as crystal_dependencies
ENV LUCKY_ENV=production
ENV SKIP_LUCKY_TASK_PRECOMPILATION=1
WORKDIR /shards
COPY shard.yml shard.lock ./
RUN  shards install --production

# Install the application Yarn dependencies, then compile production CSS/JS
FROM node:alpine as asset_build
WORKDIR /assets
COPY . .
RUN yarn install
RUN yarn prod

# Build the Lucky tasks binary
FROM crystallang/crystal:1.4.1-alpine as lucky_tasks_build
ENV LUCKY_ENV=production
RUN apk --no-cache add yaml-static
COPY . .
COPY --from=crystal_dependencies /shards/lib lib
COPY --from=asset_build /assets/public public
RUN crystal build --static --release tasks.cr -o /usr/local/bin/lucky

# Build the webserver binary
FROM crystallang/crystal:1.4.1-alpine as lucky_webserver_build
WORKDIR /webserver_build
RUN apk --no-cache add yaml-static
ENV LUCKY_ENV=production
COPY . .
COPY --from=crystal_dependencies /shards/lib lib
COPY --from=asset_build /assets/public public
RUN shards build --production --static --release
RUN mv ./bin/webserver /usr/local/bin/webserver

# Create the release script
FROM alpine as release_script_build
RUN echo "#!/bin/sh" >> /usr/local/bin/release
RUN echo "lucky db.migrate && ./webserver" >> /usr/local/bin/release
RUN chmod +x /usr/local/bin/release

# Serve the application binary
FROM alpine as webserver
WORKDIR /app
RUN apk --no-cache add postgresql-client
COPY --from=release_script_build /usr/local/bin/release release
COPY --from=lucky_tasks_build /usr/local/bin/lucky /usr/local/bin/lucky
COPY --from=lucky_webserver_build /usr/local/bin/webserver webserver
COPY --from=asset_build /assets/public public
CMD ["./release"]
