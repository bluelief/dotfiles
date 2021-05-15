#!/bin/bash

PYTHON_VER="3.8.6"
GOPACKAGE="go1.15.4.linux-amd64.tar.gz"
NODE_VER="15.1.0"

PREFIX=$HOME/.local/usr


# clone lang env
git clone https://github.com/pyenv/pyenv.git $HOME/.local/lang/pyenv
git clone https://github.com/rbenv/rbenv.git $HOME/.local/lang/rbenv
git clone https://github.com/nodenv/nodenv.git $HOME/.local/lang/nodenv

# rust setup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain nightly
rustup target add x86_64-unknown-linux-musl

# setup golang
curl -o /tmp/$GOPACKAGE https://dl.google.com/go/$GOPACKAGE
tar -C $HOME/.local/lang -xzf /tmp/$GOPACKAGE
rm -f /tmp/$GOPACKAGE

# setup python
eval "$(pyenv init -)"
mkdir -p $HOME/.local/lang/pyenv/plugins
git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
pyenv install $PYTHON_VER
pyenv global $PYTHON_VER
pip install -U pip

# setup ruby
cd $HOME/.local/lang/rbenv && src/configure && make -C src
mkdir -p $HOME/.local/lang/rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git $(rbenv root)/plugins/ruby-build
git clone https://github.com/rkh/rbenv-update.git $(rbenv root)/plugins/rbenv-update

# setup node
mkdir -p $HOME/.local/lang/nodenv/plugins
cd $HOME/.local/lang/nodenv && src/configure && make -C src
git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
git clone https://github.com/pine/nodenv-yarn-install.git $(nodenv root)/plugins/nodenv-yarn-install
git clone https://github.com/nodenv/nodenv-update.git $(nodenv root)/plugins/nodenv-update
nodenv install $NODE_VER
nodenv global $NODE_VER
