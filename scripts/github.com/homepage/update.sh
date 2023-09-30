#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; python ~/git/github-metadata/scripts/update-homepage.py )
