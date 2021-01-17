#!/bin/bash

cd /usr/src/app

dockerize -wait tcp://postgres:5432 -timeout 2700s -wait-retry-interval 10s

(bundle check || bundle install)
yarn install

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails server -p 3333 -b '0.0.0.0'