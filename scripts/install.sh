#!/bin/bash
#
# runs all install.sh files

set -e

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/features/utils.sh
export -f info # export to be used in the find/exec subshell

OS_SUFFIX=$(os_suffix)

find \
  -H "$DOTFILES/features" "$DOTFILES/extensions" \
  -maxdepth 4 \
  -type f \
  \( -name "install.sh" -o -name "install.sh.$OS_SUFFIX" \) \
  -not -path '*.git*' \
  -exec bash -c 'FILE="$0"; info "$FILE"; "$FILE"' {} ';'

success 'install.sh finished'
