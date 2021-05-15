#!/bin/bash

setup-devtools () {
  # editor
  sudo apt -y install vim

  # version control
  sudo apt -y install git

  # Secure Shell
  sudo apt -y install ssh

  # network
  sudo apt -y install wget curl

  # tar
  sudo apt -y install xz-utils

  # secure
  sudo apt -y install gpg

  # dev
  sudo apt -y install cmake pkg-config
}

## Initial setup not docker
if [ -z "$IS_DOCKER" ]; then
  # Update
  sudo apt -y update && sudo apt -y upgrade

  setup-devtools
fi

# dotfile dir
echo $(cd $(dirname $BASH_SOURCE); pwd) > $HOME/.local/.dotfiles

# setup vim-plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo | vim +PlugInstall +qall
echo "[+] Vim plug installed"


echo "[+] Complete"
