######################################
# _path
######################################
export PATH="./bin:/usr/local/bin:/usr/local/sbin:$ZSHDOT/bin:$PATH"

######################################
# env
######################################
export EDITOR='atom'

# your code folder that we can `c [tab]` to
export PROJECTS=~/code
export DEV=~/dev

######################################
# keys
######################################
# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
