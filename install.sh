#!/bin/bash

git submodule init
git submodule update

stow -t $HOME zsh vim git ack tmux

if [[ `uname` == 'Darwin' ]]; then
  brew install antibody
fi

if [[ `uname` == 'Linux' ]]; then
  # install antibody
  curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

  echo "Setting zsh as default shell"
  chsh -s $(which zsh)
fi
