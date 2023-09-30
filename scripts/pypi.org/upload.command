#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

( set -x; bash -l "${BASH_SOURCE[0]%/*}"/upload.sh )

name="$(python setup.py --name)" || exit

url="https://pypi.org/project/$name"
( set -x; open "$url" )

