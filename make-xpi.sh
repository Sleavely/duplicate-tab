#!/bin/bash -ex
V=$(cat firefox/manifest.json | jq -Mr .version)
rm -f "duplicate-tab-$V.xpi"

grep -r console.log firefox && exit

cd firefox
zip -r "../duplicate-tab-$V.xpi" . -x '*.DS_Store' -x '*Thumbs.db'

diff ../chrome/manifest.json manifest.json
