#!/bin/bash

git clone https://github.com/nodenv/nodenv.git $HOME/.local/lang/nodenv
cd $HOME/.local/lang/nodenv && src/configure && make -C src

source $HOME/.bash_profile

mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git "$(nodenv root)/plugins/node-build"
git clone https://github.com/pine/nodenv-yarn-install.git "$(nodenv root)/plugins/nodenv-yarn-install"

echo "[+] Done. Installed nodejs."
