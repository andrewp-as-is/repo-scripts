#!/usr/bin/env bash
{ set +x; } 2>/dev/null

[[ "$PWD" != */git/* ]] && echo "ERROR: $PWD" 1>&2 && exit 1

( set -x; bash ~/git/github-metadata/scripts/init.sh )
( set -x; bash ~/git/readme-generator/scripts/init.sh )
[[ $PWD == *.py ]] && {
  unlicense-text > UNLICENSE
  ( set -x; setup_generator.py > setup.py ) || exit
  ( set -x; bash ~/git/pypi-metadata/scripts/init.sh ) || exit
};:
