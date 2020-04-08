#!/bin/bash

## rbenv setup
rm -rf $HOME/.local/lang/rbenv
git clone https://github.com/rbenv/rbenv.git $HOME/.local/lang/rbenv
cd $HOME/.local/lang/rbenv && src/configure && make -C src

export RBENV_ROOT="$HOME/.local/lang/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

### As an rbenv plugin
mkdir -p $HOME/.local/lang/rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git $HOME/.local/lang/rbenv/plugins/ruby-build
