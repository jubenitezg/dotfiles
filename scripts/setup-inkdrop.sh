#!/bin/bash

source ~/.zprofile

setup_inkdrop() {
  packages_file="$HOME/.dotfiles/versions/inkdrop.txt"
  if [ -z "$packages_file" ]
  then
    echo "packages_file not found"
    exit 1
  fi
  if ! command -v ipm &> /dev/null
  then
    echo "ipm cli not found"
    exit 1
  fi

  ipm install --packages-file "$packages_file"
}


setup_inkdrop
