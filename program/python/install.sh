#!/bin/bash

rm -rf $HOME/.local/lang/pyenv
git clone https://github.com/pyenv/pyenv.git $HOME/.local/lang/pyenv

# for build python
sudo apt -y install zlib1g-dev libssl-dev libffi-dev libbz2-dev libsqlite3-dev libreadline-dev
