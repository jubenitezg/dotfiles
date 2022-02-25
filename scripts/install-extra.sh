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
}

install_extras

