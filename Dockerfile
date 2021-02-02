FROM ruby:2.7.2 as builder

# Install all the requirements
RUN apt update && apt install -y build-essential libpq-dev

# Setup ENV variables
ENV DOCKERIZE_VERSION v0.6.1
ENV BUNDLE_PATH /bundles

# Set workspace
WORKDIR /usr/src/app

# Install dockerize
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# Install node & yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y nodejs yarn

# Copy code and install app dependencies
COPY . /usr/src/app

# Install frontend dependencies
RUN yarn install

# Run bundler install
RUN gem update --system && bundle install
