#!/bin/bash

source ~/.zprofile

setup_nvim() {
  echo "Installing pip3 neovim"
  python3 -m pip install --user --upgrade neovim > /dev/null
  echo "Installing pip3 pynvim"
  python3 -m pip install --user --upgrade pynvim > /dev/null
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo "Installing neovim plugins"
  nvim +PlugInstall +qall > /dev/null
}

setup_nvim

