#!/bin/bash

# Update
sudo apt -y update && sudo apt -y upgrade

#  Develop tools
## editor
sudo apt -y install vim

## version control
sudo apt -y install git

## C compiler
sudo apt -y install gcc g++ make libc6-dev libc-dev

## Secure Shell
sudo apt -y install ssh

## misc
sudo apt -y install curl wget rsync

## tar
sudo apt -y install xz-utils

## secure
sudo apt -y install gpg


# Usee/dotfiles
## Create dir
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/lang
mkdir -p $HOME/.vim
mkdir -p $HOME/dev
mkdir -p $HOME/tmp
mkdir -p $HOME/package
echo "[+] Create dir"

## cope/dotfilesfiles
git clone https://github.com/aimergirls/dotfiles.git package/dotfiles
rsync -av $HOME/package/dotfiles/. $HOME/ \
--exclude "*.sh" --exclude ".gitignore" --exclude "LICENSE" --exclude "README.md" \
--exclude "/.git/" --exclude "/program/" --exclude "/windows/"
sudo chmod 600 $HOME/.ssh/config
echo "[+] Copy the/dotfiles files."

## set vim-plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Set workdir
WORKDIR=`pwd`
echo "[+] Set workdir: $WORKDIR"

# Install programming lang
## rust
cd package/dotfiles/program/rust && ./install.sh && cd $WORKDIR

## Python
cd package/dotfiles/program/python && ./install.sh && cd $WORKDIR

## nodejs
cd package/dotfiles/program/nodejs && ./install.sh && cd $WORKDIR

## golang
cd package/dotfiles/program/golang && ./install.sh && cd $WORKDIR

## Ruby
cd package/dotfiles/program/ruby && ./install.sh && cd $WORKDIR

echo "[+] Complete"
