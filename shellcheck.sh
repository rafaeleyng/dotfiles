#!/bin/zsh

shellcheck --exclude=SC1071 ./common/*/*.*sh ./macos/*/*.*sh ./ubuntu/*/*.*sh ./scripts/*.sh
