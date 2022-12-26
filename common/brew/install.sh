#!/bin/bash

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/common/utils.sh

# Check for brew
if test ! "$(command -v brew)"; then
  info "Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Run brew through the Brewfile
info "brew bundle"
brew bundle --file="common/brew/Brewfile"

exit 0
