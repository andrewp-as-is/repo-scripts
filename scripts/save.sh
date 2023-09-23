#!/usr/bin/env bash
{ set +x; } 2>/dev/null

[ -e .github-metadata ] && {
    ( set -x; bash ~/git/github-metadata/scripts/save.sh ) || exit
}
[ -e .readme ] && {
    ( set -x; bash ~/git/readme-generator/scripts/save.sh ) || exit
}
[ -e .pypi-metadata ] && {
    ( set -x; bash ~/git/pypi-metadata/scripts/save.sh ) || exit
};:
