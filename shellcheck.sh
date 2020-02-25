#!/bin/zsh

shellcheck -e SC1071 ./scripts/*.sh ./specific/**/*.sh ./basic/*/*.sh
