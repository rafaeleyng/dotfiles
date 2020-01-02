########################################
# aliases
########################################
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'" # copy public key to clipboard
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

########################################
# fzf
########################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(e {})+abort'"

########################################
# asdf - https://asdf-vm.com/
########################################
alias a='asdf'
. /usr/local/opt/asdf/asdf.sh
# TODO make completions work
# . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
