#!/bin/bash

# Copy config files
cp $HOME/.gitconfig $HOME/.gitconfig.bk
cp $HOME/.ssh/config $HOME/.ssh/config.bk
rsync -av $HOME/package/dotfiles/. $HOME/ \
  --exclude "*.sh" --exclude ".gitignore" --exclude "LICENSE" --exclude "README.md" \
  --exclude "/.git/" --exclude "/program/" --exclude "/windows/"
cp $HOME/.gitconfig.bk $HOME/.gitconfig
cp $HOME/.ssh/config.bk $HOME/.ssh/config
sudo chmod 600 $HOME/.ssh/config
echo "[+] Done. Copy config files."
