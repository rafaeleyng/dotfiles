#!/bin/zsh

shellcheck --exclude=SC1071 \
  ./install \
  ./update \
  ./features/*.sh \
  ./features/*/*.*sh \
  ./features/*/*.*sh.linux \
  ./features/*/*.*sh.macos \
  ./features/zsh/zshrc.symlink
