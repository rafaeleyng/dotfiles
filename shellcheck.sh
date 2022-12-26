#!/bin/zsh

shellcheck --exclude=SC1071 \
  ./common/*.sh \
  ./common/*/*.*sh \
  ./macos/*/*.*sh \
  ./linux/*/*.*sh \
  ./scripts/*.sh \
  ./common/zsh/zshrc.symlink
