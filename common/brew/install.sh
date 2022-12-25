#!/bin/bash

# Check for brew
if test ! "$(command -v brew)"; then
  echo "  Installing brew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Run brew through the Brewfile
echo "› brew bundle"
brew bundle --file="common/brew/Brewfile"

exit 0
