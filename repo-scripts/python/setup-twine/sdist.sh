#!/usr/bin/env bash
{ set +x; } 2>/dev/null

path="$( set -x; repo-python-setup-twine-sdist )" || exit
( set -x; open -R "$path" )
