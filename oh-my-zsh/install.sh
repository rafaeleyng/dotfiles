if [ ! -d $ZSH ]; then
  echo nao existe, vou clonar
  git clone git://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi
