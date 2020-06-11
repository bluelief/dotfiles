#!/bin/bash

FILE_DIR=$(cd $(dirname $BASH_SOURCE); pwd)


## set link to bash files
ln -s $FILE_DIR/.bash_profile $HOME/.bash_profile
ln -s $FILE_DIR/.bash_alias $HOME/.bash_alias
ln -s $FILE_DIR/.bash_export $HOME/.bash_export
ln -s $FILE_DIR/.bash_prompt $HOME/.bash_prompt
ln -s $FILE_DIR/.gitconfig $HOME/.gitconfig
ln -s $FILE_DIR/.gitmessage $HOME/.gitmessage
ln -s $FILE_DIR/.vimrc $HOME/.vimrc
