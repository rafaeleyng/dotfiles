#!/bin/bash
#
# runs all update.sh files

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/features/utils.sh

OS_SUFFIX=$(os_suffix)

find \
  -H "$DOTFILES/features" "$DOTFILES/extensions" \
  -maxdepth 4 \
  -type f \
  \( -name "update.sh" -o -name "update.sh.$OS_SUFFIX" \) \
  -not -path '*.git*' \
  -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;

success 'update.sh finished'
