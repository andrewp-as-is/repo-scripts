#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

( set -x; docker build -t "${PWD##*/}" "." )
