#!/bin/bash

# run all install.sh files

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
  echo ''
  exit
}

export DOTFILES="$HOME/.dotfiles"

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
  -name 'install.sh' \
  -not -path '*.git*' \
  -exec sh -c 'FILE="$1"; "$FILE"' _ {} \;
