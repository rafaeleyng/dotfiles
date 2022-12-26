#!/bin/bash

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/features/utils.sh

source scripts/setup-gitconfig.sh
source scripts/setup-symlinks.sh
source scripts/install.sh

success 'setup.sh finished'
