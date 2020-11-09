#!/bin/bash

# Set current dir
CURRENT_DIR=$(pwd)

DOTFILES=`cat $HOME/.local/.dotfiles`
PREFIX=$HOME/.local/usr

# Update linux
sudo apt -y update && sudo apt -y upgrade

# Update this repository
cd $DOTFILES
git pull

# rust
rustup update

# python
pyenv update

# ruby
rbenv update

# namp
cd $HOME/package/security/nmap
git pull
./configure --prefix=$PREFIX
make
make install

# radare2
cd $HOME/package/security/radare2
sys/user.sh --install-path $PREFIX
r2pm update
r2pm -i r2ghidra-dec

# metasploit
cd $HOME/package/security/metasploit-framework
git fetch upstream
git checkout master
git merge upstream/master
git push origin master

cd $CURRENT_DIR
echo "[+] Done. Update your computer. Have fun!!"
