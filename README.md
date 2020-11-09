Bluelief's dotfiles

```sh
export DOTFILES=$HOME/package/dotfiles \
  && mkdir -p $HOME/.local \
  && echo $DOTFILES > $HOME/.local/.dotfiles \
  && sudo apt update \
  && sudo apt upgrade \
  && sudo apt -y install \
    git \
    curl \
  && git clone https://github.com/bluelief/dotfiles.git $DOTFILES \
  && $($DOTFILES)/unlink.sh  > /dev/null 2>&1 \
  && $($DOTFILES)/setup.sh \
  && $($DOTFILES)/install.sh \
  && source $HOME/.bash_profile
```


```sh
curl https://raw.githubusercontent.com/bluelief/dotfiles/master/setup.sh -sSf | bash > /dev/null 2>&1
```


## License

Licensed under [The Unlicense](LICENSE).

