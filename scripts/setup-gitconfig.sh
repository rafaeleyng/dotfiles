#!/bin/bash
#
# setups gitconfig

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/features/utils.sh

setup_gitconfig () {
  if ! [ -f features/git/gitconfig-local.symlink ]; then
    info 'setup gitconfig'

    user ' - What is your github author name?'
    read -r -e git_authorname
    user ' - What is your github author email?'
    read -r -e git_authoremail

    sed \
      -e "s/AUTHORNAME/$git_authorname/g" \
      -e "s/AUTHOREMAIL/$git_authoremail/g" \
      features/git/gitconfig-local.symlink.example > features/git/gitconfig-local.symlink

    success 'gitconfig'
  fi
}

setup_gitconfig

success 'setup-gitconfig.sh finished'
