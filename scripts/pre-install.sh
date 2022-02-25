#!/bin/bash

install_oh_my_zsh() {
  if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi
}

install_brew_and_tools() {
  if [ ! -f "$(which brew)" ]; then
    echo "Installing brew and tools"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew bundle --file "./Brewfile"
  else
    echo "Updating homebrew"
    brew update
  fi
}

install_oh_my_zsh
install_brew_and_tools

