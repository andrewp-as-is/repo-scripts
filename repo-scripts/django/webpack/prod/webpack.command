#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

{ set -x; cd "${BASH_SOURCE[0]%/*/*/*/*/*}"; { set +x; } 2>/dev/null; }

( set -x; webpack --config assets/webpack-config/prod.js --mode=none )
