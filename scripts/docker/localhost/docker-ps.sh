#!/usr/bin/env bash

CONTAINER_NAME="${PWD##*/}"

( set -x; docker ps)
( set -x; docker ps | grep "$CONTAINER_NAME" );:
