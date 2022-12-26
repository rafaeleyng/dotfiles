#!/bin/bash
#
# runs all install.sh files

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/features/utils.sh

OS_SUFFIX=$(os_suffix)

find \
  -H "$DOTFILES/features" "$DOTFILES/extensions" \
  -type f \
  -maxdepth 4 \
  \( -name "install.sh" -o -name "install.sh.$OS_SUFFIX" \) \
  -not -path '*.git*' \
  -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;

success 'install.sh finished'
