#!/bin/bash

# Taken and adapted from https://github.com/ohmyzsh/ohmyzsh/blob/master/tools/install.sh#L159

RAINBOW="
      $(printf '\033[38;5;196m')
      $(printf '\033[38;5;202m')
      $(printf '\033[38;5;226m')
      $(printf '\033[38;5;082m')
      $(printf '\033[38;5;021m')
      $(printf '\033[38;5;093m')
      $(printf '\033[38;5;163m')
      $(printf '\033[38;5;170m')
    "
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')

display_logo () {
  printf '%s     _%s       %s_    %s__ %s_  %s_ %s      %s           %s\n' $RAINBOW $RESET
  printf '%s    | |%s     %s| |  %s/ _%s(_)%s| |%s      %s           %s\n' $RAINBOW $RESET
  printf '%s  __| |%s ___ %s| |_%s| |_ %s_ %s| |%s  ___ %s ___       %s\n' $RAINBOW $RESET
  printf '%s / _` |%s/ _ \%s| __%s|  _%s| |%s| |%s / _ \%s/ __|      %s\n' $RAINBOW $RESET
  printf '%s| (_| |%s (_) %s| |_%s| | %s| |%s| |%s|  __/%s\__ \\     %s\n' $RAINBOW $RESET
  printf '%s \__,_|%s\___/ %s\__%s|_| %s|_|%s|_|%s \___|%s|___/      %s\n' $RAINBOW $RESET
  echo 
}

while getopts ":d" option; do 
  case $option in
    d) 
      display_logo
      exit;;
  esac
done

