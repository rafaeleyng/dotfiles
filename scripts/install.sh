#!/bin/bash
#
# runs all install.sh files

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/common/utils.sh

OS_SPECIFIC_FOLDER=$(os_specific_folder)

find \
  -H "$DOTFILES/common" "$DOTFILES/$OS_SPECIFIC_FOLDER" "$DOTFILES/extensions" \
  -maxdepth 4 \
  -name 'install.sh' \
  -not -path '*.git*' \
  -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;

success 'install.sh finished'
