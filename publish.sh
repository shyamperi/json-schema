#!/bin/bash

gem build json-schema-openc-fork.gemspec
gem push $(ls *gem|tail -1)

function clean {
  rm *gem
}
trap clean EXIT
