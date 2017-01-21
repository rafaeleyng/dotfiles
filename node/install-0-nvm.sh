# node version manager

echo "  Checking nvm installation"

if [ ! -s ~/.nvm/nvm.sh ]
then
  info "Installing nvm"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install 5.12.0
  nvm alias default 5.12.0
fi
