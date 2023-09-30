#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# .config/requires.txt      custom requires (not from imports)
# requirements.txt          (imports+requires.txt)
# setup.cfg                 [options] install_requires (requirements.txt)
# tests/requirements.txt    tests/ only imports

! [ -e setup.py ] && echo "SKIP ($PWD): setup.py NOT EXISTS" && exit

pipreqs --no-follow-links --force --print . |awk -F= '{print $1}' | grep -v ^configurations | grep -v ^$ > requirements.txt

export LC_COLLATE="en_US.UTF-8"
( set -x; sort --ignore-case -u -o requirements.txt{,} ) || exit
! [ -s requirements.txt ] && { ( set -x; rm requirements.txt ) || exit; }
[ -e requirements.txt ] && ( set -x; cat requirements.txt );:

