#!/bin/bash

# Author Geisson Machado <geisonnm@gmail.com>
# My personal vim configurations

# Check OS
echo "\033[1;32m Checking your operation system..."

if [ $(uname) == "Darwin" ]; then
	
    echo "Installing Brew..."
	yes '' | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"	
    
    echo "Brew update ..."
    brew update
else
	echo "Linux OS"
fi


echo "NVM installing ..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

NVMRC="$HOME/.nvmrc"

if [ ! -f $NVMRC ]; then
     	cp $PWD/.nvmrc $HOME
else
      echo "\033[1;32m .nvm exists"
fi

echo "Installing NODE LTS@latest"
nvm install --lts

echo "Install NPM latest version"
npm install npm@5.5.1 -g

echo "Install Nodemon Global"
npm install -g nodemon

echo "Install PM2 Global"
npm install -g pm2

echo "Install ESLINT Global"
npm install -g eslint

VIMRC="$HOME/.vimrc"
VIMPLUG="$HOME/.vim/autoload/plug.vim"
VIMCOLOR="$HOME/.vim/colors/solarized.vim"

if [ ! -f $VIMPLUG ]; then
    	curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    	echo "plug.vim already exists"
fi

if [ ! -f $VIMRC ]; then
    	cp $PWD/.vimrc $HOME
    	vim $HOME/.vimrc +PlugInstall +qall
else
    	echo ".vimrc already exists"
fi

if [ ! -f $VIMCOLOR ]; then
  cp -Rf $PWD/colors $HOME/.vim
else
  echo "colors already exists"
fi
