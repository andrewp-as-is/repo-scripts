#!/usr/bin/env bash
{ set +x; } 2>/dev/null

! [ -e .git ] && echo "SKIP ($PWD): .git NOT EXISTS" && exit

heads=.git/refs/heads
[ -e .git/index ] && [ -e "$heads" ] && [ "$heads" -nt . ] && echo "SKIP ($PWD): [ $heads -nt . ]" && exit

# known-issues:
# github pages fail if broken symlinks
# `find -type l` - find symlinks
# `find -L "$PWD" -type l` - find broken symlinks

[ -e .git/refs/heads/master ] && {
    exit=
    status="$(set -x;git status -s 2>&1)"
    exit=$?
    [[ $exit != 0 ]] && echo "$status" && exit $exit
    # known-issues: broken
    # fix: rm .git/index && git add -A && git commit -q -m "fix"

    [[ -z "$status" ]] && {
        echo "SKIP ($PWD): git uptodate"
        ( set -x; /usr/bin/touch "$heads" )
        exit
    }
    echo "$status"
}
#status="$(set -x;git status -s 2>&1)"
#[[ $status == *"Changes not staged for commit"* ]] && {
    #echo "$status"; exit 1
#}
count="$(git rev-list --all --count)"
[[ $count == 1 ]] && msg="init" || msg="$(date "+%Y:%m:%d %H:%M")"
[[ -z "$msg" ]] && echo "ERROR: EMPTY COMMIT MESSAGE" && exit 1

# --allow-empty     fix empty repo commit (fails with exit code 1)
# ( set -x; git commit --allow-empty-message -m '' ) || exit
( set -x; git commit -m '-' ) || exit

# validate: `git status` must be empty
status="$(set -x; git status -s)" || exit
[[ -n "$status" ]] && echo "$status" && exit 1

( set -x; git ls-tree -r master --name-only )
