#!/bin/bash

setup-devtools () {
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
}

## Initial setup not docker
if [ -z "$IS_DOCKER" ]; then
  # Update
  sudo apt -y update && sudo apt -y upgrade

  setup-devtools
fi

# setup directory
FILE_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
mkdir -p $HOME/.local/usr
mkdir -p $HOME/.local/share/vimplug
mkdir -p $HOME/.local/usr/msf4

# dotfiledire
echo $(cd $(dirname $BASH_SOURCE); pwd) > $HOME/.local/.dotfiles

# setup vim-plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo | vim +PlugInstall +qall
echo "[+] Vim plug installed"

# setup docker
FILE_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
DOCKER=`apt list --installed 2>/dev/null | grep docker`

if [[ ! `uname -r` =~ microsoft ]] \
  && [ -z "$DOCKER" ] \
  && [ -z "$IS_DOCKER" ]; then
    $FILE_DIR/tools/docker/install.sh
    echo "[+] Docker installed"
fi

echo "[+] Complete"
