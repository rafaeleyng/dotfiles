export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"
DEFAULT_USER=$(whoami)

plugins=(docker git yarn z)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
