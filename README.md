Bluelief's dotfiles

```sh
export DOTFILES=$HOME/package/dotfiles \
  && echo $DOTFILES > $HOME/.dotfiles
  && sudo apt -y install \
    git \
    curl \
  && git clone https://github.com/bluelief/dotfiles/dotfiles.git $DOTFILES \
  && $DOTFILES/install.sh
```


```sh
curl https://raw.githubusercontent.com/bluelief/dotfiles/master/setup.sh -sSf | bash
```


## License

Licensed under [The Unlicense](LICENSE).

