#!/bin/zsh

# don't use ~ on path within quotes: https://apple.stackexchange.com/questions/434805/zsh-does-not-find-script-in-path-while-bash-does-echo-path-is-the-same
export PATH="$DOTFILES/features/bin":~/bin:"/usr/local/sbin:$PATH"
