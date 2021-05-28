#!/bin/bash

# Generate using googleapis/google-cloudevents from a local directory
# Requires qt to be installed with:
#   https://github.com/googleapis/google-cloudevents/tree/master/tools/quicktype-wrapper
qt \
--in=$(dirname $(dirname $PWD))/googleapis/google-cloudevents/jsonschema \
--out=$PWD \
--l=dart
cp -r google/events/* .
rm -rf google