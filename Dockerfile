FROM crystallang/crystal:0.35.0

LABEL maintainer="stephen@stephencodes.com"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  git \
  libc6-dev \
  libevent-dev \
  libpcre2-dev \
  libpng-dev \
  libssl-dev \
  libyaml-dev \
  libnss3-dev \
  zlib1g-dev \
  postgresql-client \
  chromium-chromedriver \
  curl \
  wget

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  nodejs \
  yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/luckyframework/lucky_cli \
  && cd lucky_cli \
  && git checkout v0.22.0 \
  && shards install \
  && crystal build src/lucky.cr \
  && mv lucky /usr/local/bin
