#!/bin/bash

# Check new version
NODEJS_BASEURL="https://nodejs.org/download/release/latest/"
LATEST_VERSION=`curl -s "https://nodejs.org/download/release/latest/" --list-only | grep linux-x64.tar.xz | awk -F'['\''"]' '{print $2}'`
CURRENT_VERSION=`node -v`

DOWNLOAD_URL=$NODEJS_BASEURL$LATEST_VERSION

if [ $CURRENT_VERSION = ${LATEST_VERSION:5:-17} ]; then
  echo "[+] Already newest version."
else
  # Reset directory
  rm -rf ~/.local/lang/node
  mkdir -p ~/.local/lang/node
  wget $DOWNLOAD_URL -O node.tar.xz
  tar Jxf ./node.tar.xz -C ~/.local/lang/node --strip-components 1 > /dev/null 2>&1
  rm -f ./node.tar.xz
  npm install -g yarn
fi

echo "[+] Done. Update nodejs."
