# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# read-only commands
alias gs='git status -sb'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gb='git branch'
alias gd='git diff'

# write commands
alias gbd='git branch -d'
alias gbD='git branch -D'
alias ga='git add .'
alias gA='git add -A'
alias gcm='git commit'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gps='git push origin HEAD'
alias gpl='git pull --prune'
alias gf='git fetch --prune'
alias gcpb='git copy-branch-name'
