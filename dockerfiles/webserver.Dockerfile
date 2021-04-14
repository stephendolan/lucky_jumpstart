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

# Build the application binary in a Crystal container
FROM crystallang/crystal:1.0.0-alpine as binary_build
RUN apk --no-cache add yaml-static
ENV LUCKY_ENV=production
WORKDIR /tmp_binary_build
COPY . .
COPY --from=crystal_dependencies /tmp_crystal/lib lib
COPY --from=webpack_build /tmp_webpack/public public
RUN crystal build --static --release src/start_server.cr -o /usr/local/bin/lucky-app

# Serve the application binary from a simple Alpine container
FROM alpine
ENV LUCKY_ENV=production
ENV NODE_ENV=production
WORKDIR /app
COPY --from=binary_build /usr/local/bin/lucky-app lucky-app
COPY --from=webpack_build /tmp_webpack/public public
CMD ["./lucky-app"]
