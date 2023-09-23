#!/usr/bin/env bash
{ set +x; } 2>/dev/null

echo $PWD
( set -x; repo-init )
