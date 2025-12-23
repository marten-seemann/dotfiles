#!/bin/bash

if [[ `uname -v` =~ "Ubuntu" ]]; then
  if [[ $EUID -eq 0 ]]; then
    apt-get update
    apt-get install -y zsh git stow zoxide fzf vim tmux
  else
    echo "Run the following command to install the dependencies:"
    echo "sudo apt update && sudo apt install -y zsh git stow zoxide fzf vim tmux"
  fi
fi

git submodule init
git submodule update

stow -t $HOME zsh vim git ack tmux

if [[ `uname` == 'Darwin' ]]; then
  brew install antibody
fi

if [[ `uname` == 'Linux' ]]; then
  # install antibody
  curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

  # ask the user to set the hostname
  orig=$(head -n1 /etc/hostname)
  read -e -p "Hostname: " -i $orig hostname
  if [[ "$orig" != "$hostname" ]]; then
    echo $hostname > /etc/hostname
    echo "Hostname changed to $hostname. Reboot required to take effect."
  fi

  echo "Setting zsh as default shell"
  chsh -s $(which zsh)
fi
