#!/bin/bash

versions_dir="$HOME/.dotfiles/versions"

ipm list --installed --bare > "${versions_dir}/inkdrop.txt"

