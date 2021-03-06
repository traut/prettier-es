#!/bin/bash

# create dist dir
mkdir -p dist

# pack grammar into JS file
node bin/ohm-to-js.js src/grammar.ohm > dist/grammar.js.new
mv -f dist/grammar.js.new dist/grammar.js

# pack bundle
#node_modules/browserify/bin/cmd.js src/main.js -o dist/prettier-elastic-query.js -d -e
node_modules/parcel-bundler/bin/cli.js build -o dist/prettier-elastic-query.js --no-minify src/main.js

# pack minified version
node_modules/parcel-bundler/bin/cli.js build -o dist/prettier-elastic-query.min.js src/main.js

# copy to docs/resources
cp dist/*.min.* docs/resources/

# cleanup
rm -f dist/grammar.js
