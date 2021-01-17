#!/bin/bash

cd /home/rails/app

bundle install
yarn install

dockerize -wait tcp://postgres:5432 -timeout 2700s -wait-retry-interval 10s

rails db:create
rails db:migrate
rails server -p 3333 -b 0.0.0.0
