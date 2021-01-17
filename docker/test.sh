#!/bin/bash

set -e

# This script runs the entire test suite AND logs the screen output.

DATE=`date +%Y%m%d-%H%M%S-%3N`
docker/test-log 2>&1 | tee log/test-$DATE.log
