#!/bin/bash

# Check newest version
NODEJS_BASEURL="https://nodejs.org/download/release/latest/"
LATEST_VERSION=`curl -s "https://nodejs.org/download/release/latest/" --list-only | grep linux-x64.tar.xz | awk -F'['\''"]' '{print $2}'`

DOWNLOAD_URL=$NODEJS_BASEURL$LATEST_VERSION

wget $DOWNLOAD_URL -O node.tar.xz
mkdir -p ~/.local/lang/node
tar Jxfv ./node.tar.xz -C ~/.local/lang/node --strip-components 1 > /dev/null 2>&1
rm -f ./node.tar.xz

npm install -g yarn

echo "[+] Done. Installed nodejs."
