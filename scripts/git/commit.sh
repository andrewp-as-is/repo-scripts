#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; repo-git-init &&repo-git-add && repo-git-commit )
