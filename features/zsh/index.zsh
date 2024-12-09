#!/bin/zsh

######################################
# config
######################################
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($DOTFILES/features/functions $fpath)

autoload -U $DOTFILES/features/functions/*(:t)

HISTFILE=~/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

# TODO: I think these need to live in zshrc because of the whole subshell thing
# setopt NO_BG_NICE # don't nice background tasks
# setopt NO_HUP
# setopt NO_LIST_BEEP
# setopt LOCAL_OPTIONS # allow functions to have local options
# setopt LOCAL_TRAPS # allow functions to have local traps
# setopt HIST_VERIFY
# setopt SHARE_HISTORY # share history between sessions ???
# setopt EXTENDED_HISTORY # add timestamps to history
# setopt PROMPT_SUBST
# setopt CORRECT
# setopt COMPLETE_IN_WORD
# setopt IGNORE_EOF

# setopt APPEND_HISTORY # adds history
# setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
# setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
# setopt HIST_REDUCE_BLANKS

# # don't expand aliases _before_ completion has finished
# #   like: git comm-[tab]
# setopt complete_aliases

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

######################################
# window
######################################
# From http://dotfiles.org/~_why/.zshrc
# Sets the window title nicely no matter where you are
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$2\a" # plain xterm title ($3 for pwd)
    ;;
  esac
}

######################################
# completion
######################################
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

############################################################################
# customizations
############################################################################

######################################
# variables
######################################
export DOTFILES_DEBUG="0" # change to "1" to print debug information
export EDITOR='code'
export PROJECTS=~/code

########################################
# aliases
########################################
alias a='asdf'

########################################
# fzf - https://github.com/junegunn/fzf
########################################
if [[ -f ~/.fzf.zsh ]]; then
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
# safe-rm
########################################
alias rm="safe-rm"

########################################
# asdf - https://asdf-vm.com/
########################################
source $(brew --prefix asdf)/libexec/asdf.sh

########################################
# gh - https://cli.github.com/
########################################
eval "$(gh copilot alias -- zsh)"
alias want="gh copilot suggest -t shell"
