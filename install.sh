#!/bin/bash

# Update
sudo apt -y update && sudo apt -y upgrade

#  Develop tools
## editor
sudo apt -y install vim

## version control
sudo apt -y install git

## Secure Shell
sudo apt -y install ssh

## misc
sudo apt -y install wget

## tar
sudo apt -y install xz-utils

## secure
sudo apt -y install gpg


# Usee/dotfiles
## Create dir
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/lang
mkdir -p $HOME/.local/usr
mkdir -p $HOME/.vim
mkdir -p $HOME/dev
mkdir -p $HOME/tmp
mkdir -p $HOME/package
echo "[+] Create dir"


## setup vim-plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo | vim +PlugInstall +qall
echo "[+] Vim plug installed"


## setup docker
FILE_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
DOCKER=`apt list --installed 2>/dev/null | grep docker.io`

if [[ ! `uname -r` =~ microsoft ]] \
  && [ -z "$DOCKER" ]; then
    $FILE_DIR/tools/docker/install.sh
    echo "[+] Docker installed"
fi

echo "[+] Complete"
