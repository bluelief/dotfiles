#!/bin/bash
# Update script

# Set current dir
CURRENT_DIR=$(pwd)

# Update linux
sudo apt -y update && sudo apt -y upgrade

# Update this repository
cd $HOME/package/dotfiles
git pull

# Copy config files
cp $HOME/.gitconfig $HOME/.gitconfig.bk
cp $HOME/.ssh/config $HOME/.ssh/config.bk
rsync -av $HOME/package/dotfiles/. $HOME/ \
--exclude "*.sh" --exclude ".gitignore" --exclude "LICENSE" --exclude "*.md" \
--exclude "/.git/" --exclude "/program/" --exclude "/windows/"
cp $HOME/.gitconfig.bk $HOME/.gitconfig
cp $HOME/.ssh/config.bk $HOME/.ssh/config
sudo chmod 600 $HOME/.ssh/config
echo "[+] Done. Copy config files."


## program

### rust
rustup update

### pyenv
cd $HOME/package/dotfiles/program/python && ./update.sh

### rbenv
cd $HOME/package/dotfiles/program/ruby && ./update.sh

### node
cd $HOME/package/dotfiles/program/nodejs && ./update.sh


cd $CURRENT_DIR
echo "[+] Done. Update your computer. Have fun!!"
