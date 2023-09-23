#!/usr/bin/env bash
{ set +x; } 2>/dev/null

path="$( set -x; bash ~/git/pypi-metadata/scripts/sdist.sh )" || exit
( set -x; open -R "$path" )
