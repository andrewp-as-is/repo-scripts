#!/usr/bin/env bash
{ set +x; } 2>/dev/null

name="$(python setup.py --name)" || exit

url="https://test.pypi.org/project/$name"
( set -x; open "$url" )

