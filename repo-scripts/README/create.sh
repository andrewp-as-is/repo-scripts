#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; bash ~/git/readme-generator/bin-scripts/readme-generator > README.md )
