#!/bin/bash

source ~/.zprofile

eval "$(op signin)"
op item get "Tokens" --field notesPlain > ${HOME}/.tokens.sh

