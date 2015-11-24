# node version manager

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

if [ -s ~/.nvm/nvm.sh ]
then
  source ~/.nvm/nvm.sh
  nvm use stable > /dev/null
else
  info "Installing nvm"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install stable
  nvm use stable
fi
