#!/usr/bin/env bash
{ set +x; } 2>/dev/null

login="$(git config user.name)" || exit
repo="$(awk -F/ '{print $(NF)}' <<< "$PWD")" || exit
# fullname="$(awk -F/ '{print $(NF-1)"/"$(NF)}' <<< "$PWD")" || exit
fullname="${login}/${repo}"
url="https://github.com/$fullname"
( set -x; open "$url" )
