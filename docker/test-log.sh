#!/bin/bash

echo '--------------------------------------------------------------------'
echo 'BEGIN: docker-compose run rails-app bundle exec rake db:test:prepare'
echo '--------------------------------------------------------------------'
docker-compose run rails-app bundle exec rake db:test:prepare
echo '------------------------------------------------------------------'
echo 'END: docker-compose run rails-app bundle exec rake db:test:prepare'
echo '------------------------------------------------------------------'

echo '----------------------------------------------------------'
echo 'BEGIN: docker-compose run rails-app bundle exec rspec spec'
echo '----------------------------------------------------------'
docker-compose run rails-app bundle exec rspec spec
echo '--------------------------------------------------------'
echo 'END: docker-compose run rails-app bundle exec rspec spec'
echo '--------------------------------------------------------'
