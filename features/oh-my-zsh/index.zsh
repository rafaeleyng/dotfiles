#!/bin/zsh

export ZSH=~/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=$(whoami)

plugins=(asdf docker-compose git macos z)

source $ZSH/oh-my-zsh.sh # This is the slowest sourcing of the startup
