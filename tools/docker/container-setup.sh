#!/bin/bash

PYTHON_VER="3.8.3"
GOPACKAGE="go1.14.4.linux-amd64.tar.gz"
NODE_VER="14.4.0"

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
pyenv install $PYTHON_VER
pyenv global $PYTHON_VER
pip install -U pip

# setup ruby
cd $HOME/.local/lang/rbenv && src/configure && make -C src
mkdir -p $HOME/.local/lang/rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git $HOME/.local/lang/rbenv/plugins/ruby-build
cd $HOME/.local/lang/nodenv && src/configure && make -C src

# setup node
mkdir -p $HOME/.local/lang/nodenv/plugins
git clone https://github.com/nodenv/node-build.git $HOME/.local/lang/nodenv/plugins/node-build
git clone https://github.com/pine/nodenv-yarn-install.git $HOME/.local/lang/nodenv/plugins/nodenv-yarn-install
nodenv install $NODE_VER
nodenv global $NODE_VER

# setup nmap
git clone https://github.com/nmap/nmap.git $HOME/package/security/nmap
cd $HOME/package/security/nmap
./configure --prefix=$PREFIX
make
make install

# setup radare2
git clone https://github.com/radareorg/radare2 $HOME/package/security/radare2
cd $HOME/package/security/radare2
sys/user.sh --install-path $PREFIX
r2pm init
r2pm update
r2pm install r2ghidra-dec

# setup metasploit
git clone https://github.com/stellviaorg/metasploit-framework.git $HOME/package/security/metasploit-framework
cd $HOME/package/security/metasploit-framework
git remote add upstream https://github.com/rapid7/metasploit-framework.git
git fetch upstream
git checkout -b upstream-master --track upstream/master
ln -sf tools/dev/pre-commit-hook.rb .git/hooks/pre-commit
ln -sf tools/dev/pre-commit-hook.rb .git/hooks/post-merge
rbenv install $(cat .ruby-version)
rbenv global $(cat .ruby-version)
eval "$(rbenv init -)"
gem install bundler
cd .
bundle install
