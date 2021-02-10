#!/bin/bash

cd /usr/src/app

if [ ! -f ".env" ]; then
  cp .env.example .env
fi

if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

dockerize -wait tcp://postgres:5432 -timeout 2700s -wait-retry-interval 10s
dockerize -wait tcp://redis:6379 -timeout 2700s -wait-retry-interval 10s

bundle exec rails db:prepare
bundle exec rails server -p 3333 -b '0.0.0.0'
