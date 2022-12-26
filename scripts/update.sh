#!/bin/bash
#
# runs all update.sh files

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/common/utils.sh

OS_SUFFIX=$(os_suffix)

find \
  -H "$DOTFILES/common" "$DOTFILES/extensions" \
  -type f \
  -maxdepth 4 \
  \( -name "update.sh" -o -name "update.sh.$OS_SUFFIX" \) \
  -not -path '*.git*' \
  -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;

success 'update.sh finished'
