#!/bin/sh
DIR=$(cd $(dirname $0); pwd -P)
mkdir -p $DIR/db
mongod --dbpath $DIR/db
