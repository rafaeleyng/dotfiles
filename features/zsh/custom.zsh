#!/bin/zsh

######################################
# variables
######################################
export DOTFILES_DEBUG="0" # change to "1" to print debug information
export PATH="$DOTFILES/features/bin:~/bin:/usr/local/sbin:$PATH"
export EDITOR='code'
export PROJECTS=~/code

########################################
# aliases
########################################
alias a='asdf'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'" # copy public key to clipboard

########################################
# fzf - https://github.com/junegunn/fzf
########################################
if [[ -f ~/.fzf.zsh ]]; then
  # shellcheck disable=SC1090
  source ~/.fzf.zsh
fi
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in the default text editor
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(e {})+abort'"

########################################
# powerlevel10k
########################################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

########################################
# temp
########################################
ZSH_TEMP="$DOTFILES"/features/zsh/temp.zsh
[[ -f "$ZSH_TEMP" ]] && source "$ZSH_TEMP"
