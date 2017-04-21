export ZSH=~/.oh-my-zsh

if [ ! -d $ZSH ]; then
  git clone git://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi
