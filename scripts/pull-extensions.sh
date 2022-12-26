#!/bin/bash
#
# pulls all repos inside extensions folder

DOTFILES="$HOME/.dotfiles"

for FOLDER in "$DOTFILES"/extensions/*; do
  git -C "$FOLDER" pull --rebase
done

success 'pull-extensions.sh finished'
