#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# .config/requires.txt      custom requires (not from imports)
# requirements.txt          (imports+requires.txt)
# setup.cfg                 [options] install_requires (requirements.txt)
# tests/requirements.txt    tests/ only imports

! [ -e setup.py ] && echo "SKIP ($PWD): setup.py NOT EXISTS" && exit

dst=requirements.txt

[ -e .config/requires.txt ] && { ( set -x; cp .config/requires.txt "$dst" ); exit; }

. ~/.bashrc

pipreqs --force --print . |awk -F= '{print $1}' | grep -v ^configurations | grep -v ^$ > requirements.txt

# ( set -o pipefail; set -x; requires42 . | awk -F '=' '{print $1}' ) > "$dst" || exit
( set -x; cat "$dst" ) || exit
! [ -s requirements.txt ] && { ( set -x; rm requirements.txt ) || exit; };:

