#!/bin/bash
#
# runs all update.sh files

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/common/utils.sh

UNAME=$(uname -s)
if [ "$UNAME" = "Darwin" ]; then
  OS_SPECIFIC_FOLDER="macos"
elif  [ "$UNAME" = "Linux" ]; then
  OS_SPECIFIC_FOLDER="linux"
else
  fail "unsupported OS ${UNAME}"
fi

cd "$(dirname "$0")"/.. || exit
find \
  -H "$DOTFILES/common" "$DOTFILES/$OS_SPECIFIC_FOLDER" "$DOTFILES/extensions" \
  -maxdepth 4 \
  -name 'update.sh' \
  -not -path '*.git*' \
  -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;

success 'update.sh finished'
