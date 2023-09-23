#!/usr/bin/env bash
{ set +x; } 2>/dev/null

! [ -e setup.py ] && echo "SKIP ($PWD): setup.py NOT EXISTS" && exit

name="$(IFS='.';set ${PWD##*/};echo $1)" || exit
version="$(python3 setup.py --version)" || exit
url="https://pypi.org/project/$name/$version"
( set -x; curl -fs -IL -o /dev/null "$url" ) && echo "SKIP ($PWD): uptodate" && exit

# todo: github actions check
# ( set -x;repo:web:travis-ci.org:check ) || exit
sdist="$( set -x; bash ~/git/pypi-metadata/scripts/sdist.sh )" || exit
( set -x; python3 -m twine upload -r "pypi" --config-file=~/.pypirc "$sdist" )
