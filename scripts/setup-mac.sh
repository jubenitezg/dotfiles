#!/bin/bash

# Mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling 5

# Set finder to display full path in title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

# Set finder to display all files
defaults write com.apple.finder AppleShowAllFiles YES

defaults write -g ApplePressAndHoldEnabled -bool false

