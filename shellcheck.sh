#!/bin/zsh

shellcheck --exclude=SC1071 ./features/*/*.sh ./scripts/*.sh
