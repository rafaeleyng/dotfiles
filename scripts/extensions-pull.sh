#!/bin/sh
#
# pulls all repos inside extensions folder
export DOTFILES="$HOME/.dotfiles"

for FOLDER in $(ls "$DOTFILES/extensions"); do
  git -C "$DOTFILES/extensions/$FOLDER" pull --rebase
done
