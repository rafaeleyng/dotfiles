#!/bin/sh
#
# run all dotfiles installers
export DOTFILES="$HOME/.dotfiles"

cd "$(dirname $0)"/..
for FILE in $(find -H "$DOTFILES" -maxdepth 4 -name 'update.sh'  -not -path '*.git*'); do
  sh -c "${FILE}"
done
