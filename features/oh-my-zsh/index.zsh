#!/bin/zsh

export ZSH=~/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=$(whoami)

plugins=(docker docker-compose git z)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
