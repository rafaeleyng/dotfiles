export NVM_DIR="$HOME/.nvm"

if [ ! -d $NVM_DIR ]; then
  mkdir $NVM_DIR
fi

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

echo "  Installing node $NODE_VERSION"
NODE_VERSION=12.3.1
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION
nvm use default
