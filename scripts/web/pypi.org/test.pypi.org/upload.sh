#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; repo-test-pypi-upload ) || exit

name="$(python setup.py --name)" || exit

url="https://test.pypi.org/project/$name"
( set -x; open "$url" )

