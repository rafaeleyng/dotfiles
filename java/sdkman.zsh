# sdk manager

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

if [ ! -s ~/.sdkman/bin/sdkman-init.sh ]
then
  info "Installing sdkman"
  curl -s get.sdkman.io | bash
fi

export SDKMAN_DIR=~/.sdkman
source $SDKMAN_DIR/bin/sdkman-init.sh
