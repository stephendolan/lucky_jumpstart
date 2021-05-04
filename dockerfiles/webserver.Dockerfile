# Install the application Crystal dependencies in a Crystal container
FROM crystallang/crystal:1.0.0-alpine as crystal_dependencies
ENV SKIP_LUCKY_TASK_PRECOMPILATION="1"
WORKDIR /tmp_crystal
COPY shard.yml shard.lock ./
RUN  shards install --production

# Install the application Yarn dependencies in a Crystal container
FROM node:alpine as node_dependencies
WORKDIR /tmp_node
COPY package.json yarn.lock .
RUN yarn install

# Compile the production CSS/JS assets in a Node container
FROM node:alpine as webpack_build
ENV NODE_ENV=production
WORKDIR /tmp_webpack
COPY . .
COPY --from=node_dependencies /tmp_node/node_modules node_modules
RUN yarn prod

# Build the Lucky tasks binaries
FROM crystallang/crystal:1.0.0-alpine as lucky_build
RUN apk --no-cache add yaml-static
ENV LUCKY_ENV=production
WORKDIR /tmp_lucky_build
COPY . .
COPY --from=crystal_dependencies /tmp_crystal/lib lib
COPY --from=webpack_build /tmp_webpack/public public
RUN crystal build --static --release tasks.cr -o /usr/local/bin/lucky

# Build the application binary in a Crystal container
FROM crystallang/crystal:1.0.0-alpine as webserver_build
RUN apk --no-cache add yaml-static
ENV LUCKY_ENV=production
WORKDIR /tmp_webserver_build
COPY . .
COPY --from=crystal_dependencies /tmp_crystal/lib lib
COPY --from=webpack_build /tmp_webpack/public public
RUN shards build --production --static --release
RUN mv ./bin/webserver /usr/local/bin/webserver

# Create the release script
FROM alpine as release_script_build
RUN echo "#!/bin/sh\n" \
         "lucky db.migrate\n" \
         "./webserver" > /usr/local/bin/release
RUN chmod +x /usr/local/bin/release

# Serve the application binary from a simple Alpine container
FROM alpine as webserver
ENV LUCKY_ENV=production
ENV NODE_ENV=production
WORKDIR /app
COPY --from=release_script_build /usr/local/bin/release release
COPY --from=lucky_build /usr/local/bin/lucky /usr/local/bin/lucky
COPY --from=webserver_build /usr/local/bin/webserver webserver
COPY --from=webpack_build /tmp_webpack/public public
CMD ["./release"]
