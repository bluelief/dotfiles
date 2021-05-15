#!/bin/bash
FILE_DIR=$(cd $(dirname $BASH_SOURCE); pwd)

# clear files
rm -rf $HOME/.bashrc $HOME/.bash_profile $HOME/.zshrc $HOME/.gnupg $HOME/.ssh

# set link to bash files
if [ $SHELL = "/bin/zsh" ]; then
  ln -s $FILE_DIR/.zshrc $HOME/.zshrc
else
  ln -s $FILE_DIR/.bash_profile $HOME/.bash_profile
fi

mkdir -p $HOME/.local/usr
mkdir -p $HOME/.local/share/vimplug
mkdir -p $HOME/.visualarts/.ssh
mkdir -p $HOME/.visualarts/.gnupg

ln -s $FILE_DIR/.gitconfig $HOME/.gitconfig
ln -s $FILE_DIR/.gitmessage $HOME/.gitmessage
ln -s $FILE_DIR/.vimrc $HOME/.vimrc
ln -s $HOME/.local/share/vimplug $HOME/.vim
ln -s $HOME/.visualarts/.gnupg $HOME/.gnupg
ln -s $HOME/.visualarts/.ssh $HOME/.ssh
