#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; setup_generator.py > setup.py ) || exit
( set -x; cat setup.py )
