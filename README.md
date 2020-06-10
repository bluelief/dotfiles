Bluelief's dotfiles

```sh
export DOTFILES=$HOME/package/dotfiles \
  && echo $DOTFILES > $HOME/.dotfiles
  && sudo apt -y install \
    git \
    curl \
  && git clone https://github.com/bluelief/dotfiles/dotfiles.git $DOTFILES \
  && $DOTFILES/install.sh \
  && $DOTFILES/setup.sh
```


## License

Licensed under [The Unlicense](LICENSE).

