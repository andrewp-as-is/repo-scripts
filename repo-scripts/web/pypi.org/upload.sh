#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; repo-pypi-upload && repo-pypi-browse  )
