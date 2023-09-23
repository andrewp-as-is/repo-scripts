#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# todo: -nt ?

( set -x; repo-git-remote ) || exit

! [ -e .git/config ] && echo "$PWD/.git/config NOT EXISTS" && exit
# remote="$(git remote -v | grep "github.com" | awk '{print $1}' | uniq)"
remote="$(git remote -v | awk '{print $1}' | uniq)"
[[ -z "$remote" ]] && echo "SKIP ($PWD): remote EMPTY" && exit

( set -x; git push -f --all "$remote" 2>&1 ) || exit
[ -e .gitmodules ] && {
    ( set -x; git submodule -q foreach git push origin master ) || exit
};:
