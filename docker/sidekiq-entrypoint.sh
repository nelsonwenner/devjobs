#!/bin/bash

cd /usr/src/app

if [ ! -f ".env" ]; then
  cp .env.example .env
fi

if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

dockerize -wait tcp://rails-app:3333 -timeout 2700s -wait-retry-interval 10s

bundle exec sidekiq
