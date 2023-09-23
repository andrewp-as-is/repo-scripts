#!/usr/bin/env bash
{ set +x; } 2>/dev/null

{ set -x; cd "${0%/*/*/*}"; { set +x; } 2>/dev/null; }

[[ "$PWD" != */git/* ]] && echo "ERROR: $PWD" 1>&2 && exit 1

( set -x; git init )
