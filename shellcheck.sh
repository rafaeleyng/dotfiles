#!/bin/zsh

shellcheck --exclude=SC1071 ./common/*/*.*sh ./macos/*/*.*sh ./linux/*/*.*sh ./scripts/*.sh
