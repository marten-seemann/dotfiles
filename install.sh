#!/bin/bash

git submodule init
git submodule update

stow -t $HOME zsh vim git ack

if [[ `uname` == 'Linux' ]]; then
  echo "Setting zsh as default shell"
  chsh -s $(which zsh)
fi
