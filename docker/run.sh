#!/bin/bash

set -e

# Use this script to execute commaands in the Docker container.
# Example: To run the "ls -l" command in the Docker container, enter the command "docker/run ls -l".

function cleanup {
  # capture exit code
  code=$?
  echo "cleaning up"

  # ignore errors
  set +e
  docker-compose down

  exit $code
}

trap cleanup EXIT

docker-compose run rails-app $@
