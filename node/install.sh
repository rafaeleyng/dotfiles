node_install_nvm_and_node () {
  local NVM_DIR=~/.nvm
  local NVM_FILE=$NVM_DIR/nvm.sh
  local NVM_VERSION=0.33.1
  local NODE_VERSION=6.10.1

  echo "  Checking nvm installation"

  if [ ! -s ~/.nvm/nvm.sh ]
  then
    echo "  Installing nvm $NVM_VERSION"
    rm -fr $NVM_DIR
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash
    source $NVM_FILE
  fi

  echo "  Installing node $NODE_VERSION"
  nvm install $NODE_VERSION
  nvm alias default $NODE_VERSION
}

node_install_global_dependencies () {
  npm i -g diff-so-fancy
}

node_install_nvm_and_node
node_install_global_dependencies
