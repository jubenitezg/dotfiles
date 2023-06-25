#!/bin/bash

packages_dir="$HOME/.dotfiles/apps-config/inkdrop/"

ipm list --installed --bare > "${packages_dir}/packages.txt"

