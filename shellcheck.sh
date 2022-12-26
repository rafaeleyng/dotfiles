#!/bin/zsh

shellcheck --exclude=SC1071 \
  ./common/*.sh \
  ./common/*/*.*sh \
  ./common/*/*.*sh.linux \
  ./common/*/*.*sh.macos \
  ./scripts/*.sh \
  ./common/zsh/zshrc.symlink
