#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; . ~/git/repo-scripts/scripts/git/init.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/git/add.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/git/commit.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/git/remote/add.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/github.com/create.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/git/push.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/github.com/description/update.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/github.com/homepage/update.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/github.com/topics/update.sh ) || exit
( set -x; . ~/git/repo-scripts/scripts/github.com/browse.sh ) || exit
