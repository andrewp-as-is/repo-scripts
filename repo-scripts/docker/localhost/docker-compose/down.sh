#!/usr/bin/env bash

( set -x; docker-compose -f docker-compose.yml -f docker-compose.dev.yml down )
