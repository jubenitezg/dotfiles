#!/bin/bash

source ~/.zprofile 

install_extras() {
  echo "Installing rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  echo "Installing tldr-pages"
  npm install -g tldr > /dev/null

  echo "Installing yarn"
  npm install -g yarn > /dev/null

  echo "Installing typescript"
  npm install -g typescript typescript-language-server > /dev/null

  echo "Installing powerline-status"
  pip install --user powerline-status > /dev/null

  echo "Installing tmux powerline"
  git clone git@github.com:erikw/tmux-powerline.git ~/.tmux-powerline
  rm ~/.tmux-powerline/themes/default.sh
  ln -s ~/.dotfiles/tmux/default.sh ~/.tmux-powerline/themes/default.sh
}

install_extras

