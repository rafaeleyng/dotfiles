#!/bin/zsh

shellcheck --exclude=SC1071 \
  ./scripts/*.sh \
  ./features/*.sh \
  ./features/*/*.*sh \
  ./features/*/*.*sh.linux \
  ./features/*/*.*sh.macos \
  ./features/zsh/zshrc.symlink
