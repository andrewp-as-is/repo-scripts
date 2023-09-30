#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; . ~/git/repo-scripts/scripts/git/init.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/git/add.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/git/commit.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/git/commit.sh ) || exit
