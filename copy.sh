#!/bin/bash

# Copy config files
cp $HOME/.gitconfig.aimergirls $HOME/.gitconfig.aimergirls.bk
cp $HOME/.ssh/config $HOME/.ssh/config.bk
rsync -av $HOME/package/dotfiles/. $HOME/ \
  --exclude "*.sh" --exclude ".gitignore" --exclude "LICENSE" --exclude "README.md" \
  --exclude "/.git/" --exclude "/program/" --exclude "/windows/"
cp $HOME/.gitconfig.aimergirls.bk $HOME/.gitconfig.aimergirls
cp $HOME/.ssh/config.bk $HOME/.ssh/config
echo "[+] Done. Copy config files."
