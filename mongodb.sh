#!/bin/sh
trap "kill -- -$$" EXIT
DIR=$(cd $(dirname $0); pwd -P)
mkdir -p $DIR/db
mongod --dbpath $DIR/db
