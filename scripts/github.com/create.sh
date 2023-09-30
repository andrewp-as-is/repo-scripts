#!/usr/bin/env bash
{ set +x; } 2>/dev/null

! [ -e .git ] && echo "ERROR: $PWD/.git NOT EXISTS" 1>&2 && exit 1

fullname="$(git config user.name)/${PWD##*/}"
url="https://github.com/$fullname"

curl -f -I -s --max-time 5 -o /dev/null "$url" && echo "SKIP: $url EXISTS" && exit

( set -x; python3 "${BASH_SOURCE[0]%/*}"/create.py )
