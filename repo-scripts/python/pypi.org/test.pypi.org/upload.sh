#!/usr/bin/env bash
{ set +x; } 2>/dev/null

( set -x; repo-test-pypi-upload && repo-test-pypi-browse  )
