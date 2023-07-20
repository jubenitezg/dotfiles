#!/bin/bash

source "${HOME}/.zprofile"

setup_inkdrop_plugins() {
  local packages_file="${HOME}/.dotfiles/apps-config/inkdrop/packages.txt"
  if [ -z "$packages_file" ]; then
    echo "packages_file not found"
    exit 1
  fi
  if ! command -v ipm &>/dev/null; then
    echo "ipm cli not found"
    exit 1
  fi

  ipm install --packages-file "$packages_file"
}

setup_inkdrop_keymap() {
  local keys_file="${HOME}/.dotfiles/apps-config/inkdrop/keymap.cson"
  if [ -z "$keys_file" ]; then
    echo "keys_file not found"
    exit 1
  fi
  local app_path="${HOME}/Library/Application Support/inkdrop/"
  cp "${keys_file}" "${app_path}"
}

setup_inkdrop_plugins
setup_inkdrop_keymap
