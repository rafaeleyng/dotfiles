#!/bin/zsh

shellcheck --exclude=SC1071 ./common/utils.sh ./common/*/*.*sh ./macos/*/*.*sh ./linux/*/*.*sh ./scripts/*.sh
