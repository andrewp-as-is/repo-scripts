#!/usr/bin/open -a Terminal
{ set +x; } 2>/dev/null

( set -x; sleep 30 ) || exit # foolproof
name="$(node -e "console.log(require('./package.json').name);")" || exit
deprecated="deprecated"
( set -x; npm deprecate "$name" "$deprecated" )

# deprecate and transfer ownership to npm
# ( set -x; npx force-unpublish "$name" 'reason message' )
