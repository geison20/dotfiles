#!/bin/bash

echo "NVM -----------------------------------------------"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

NVMRC="$HOME/.nvmrc"

if [ ! -f $NVMRC ]; then
     	cp $PWD/.nvmrc $HOME
else
     	echo ".nvmrc already exists"
fi

echo "NODE -----------------------------------------------"

echo "Installing NODE LTS@latest"
nvm install --lts

echo "Install NPM latest version"
npm install npm@5.5.1 -g

echo "Install Nodemon Global"
npm install -g nodemon

echo "Install PM2 Global"
npm install -g pm2

echo "VIM -----------------------------------------------"

VIMRC="$HOME/.vimrc"
VIMPLUG="$HOME/.vim/autoload/plug.vim"

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


if [ $(uname) == "Darwin" ]; then
	echo "ONLY MACBOOK -----------------------------------------------"

	echo "BREW -----------------------------------------------"
	yes '' | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	echo "BREW -----------------------------------------------"
	
else
	echo "ONLY UBUNTU -----------------------------------------------"
fi
