#!/bin/bash

# run all update.sh files

export DOTFILES="$HOME/.dotfiles"

cd "$(dirname "$0")"/.. || exit
find \
  -H "$DOTFILES/features" "$DOTFILES/extensions" \
  -maxdepth 4 \
  -name 'update.sh' \
  -not -path '*.git*' \
  -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;
