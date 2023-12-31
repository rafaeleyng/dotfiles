#!/bin/bash

# Check for brew
if test ! "$(command -v brew)"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Run brew through the Brewfile
brew bundle --file="features/brew/Brewfile"

exit 0
