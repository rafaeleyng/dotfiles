#!/bin/zsh

source scripts/setup-gitconfig.sh
source scripts/setup-symlinks.sh

info "installing dependencies"
if source scripts/install.sh
then
  success "dependencies installed"
else
  fail "error installing dependencies"
fi

echo ''
success '  Setup finished!'
