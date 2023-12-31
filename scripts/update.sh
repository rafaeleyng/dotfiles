#!/bin/bash
#
# runs all update.sh files

set -e

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/features/utils.sh
export -f info # export to be used in the find/exec subshell

function pull_dotfiles () {
  local BRANCH
  BRANCH=$(git rev-parse --abbrev-ref HEAD)

  if [[ ! $BRANCH = "main" ]]; then
    info "Not on main branch, skipping pull_dotfiles"
  elif [[ -n "$(git status --porcelain)" ]]; then
    info "Status not clean, skipping pull_dotfiles"
  else
    info "Pulling dotfiles"
    git -C "$DOTFILES" pull --rebase
  fi
}

function pull_extensions () {
  for FOLDER in "$DOTFILES"/extensions/*; do
    info "Pulling extension $FOLDER"
    git -C "$FOLDER" pull --rebase
  done
}

function exec_updates () {
  local OS_SUFFIX
  OS_SUFFIX=$(os_suffix)

  find \
    -H "$DOTFILES/features" "$DOTFILES/extensions" \
    -maxdepth 4 \
    -type f \
    \( -name "update.sh" -o -name "update.sh.$OS_SUFFIX" \) \
    -not -path '*.git*' \
    -exec bash -c 'FILE="$0"; info "$FILE"; "$FILE"' {} ';'
}


pull_dotfiles
pull_extensions
exec_updates

success 'update.sh finished'
