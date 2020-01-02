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
# zlib
########################################
# For compilers to find zlib you may need to set:
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

########################################
# slack
########################################
# alias slack1="curl -X PUT http://pi1.local:9000/api/v1/inputs/1"
# alias slack2="curl -X PUT http://pi1.local:9000/api/v1/inputs/2"
# alias slack3="curl -X PUT http://pi1.local:9000/api/v1/inputs/3"

########################################
# thumbor
########################################
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

########################################
# switchaudio-osx - https://github.com/deweller/switchaudio-osx
########################################
S_SYS_1="s -t system -s 'External Headphones'"
S_OUT_1="s -t output -s 'External Headphones'"
S_IN_1="s -t input -s 'ARCANO AM-BLACK-1 '" # yes, with a trailing space ¯\_(ツ)_/¯

S_SYS_2="s -t system -s 'DisplayPort'"
S_OUT_2="s -t output -s 'DisplayPort'"
S_IN_2="s -t input -s 'External Microphone'"

S_SYS_3="s -t system -s 'Microsoft LifeChat LX-3000'"
S_OUT_3="s -t output -s 'Microsoft LifeChat LX-3000'"

alias s='SwitchAudioSource'
alias sn='s -n'
alias s1="($S_OUT_1) && ($S_SYS_1) && ($S_IN_1 || $S_IN_2)"
alias s2="($S_OUT_2) && ($S_SYS_2) && ($S_IN_1 || $S_IN_2)"
alias s3="($S_OUT_3) && ($S_SYS_3) && ($S_IN_1 || $S_IN_2)"

########################################
# asdf - https://asdf-vm.com/
########################################
alias a='asdf'
. /usr/local/opt/asdf/asdf.sh
# TODO make completions work
# . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# TODO - sep - https://gist.github.com/steve-jansen/61a189b6ab961a517f68

# TODO - globalprotect - https://www.joshcurry.co.uk/posts/how-to-quit-globalprotect-mac
# launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
# launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
