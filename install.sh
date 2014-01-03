#!/bin/bash

git submodule init
git submodule update

stow -t $HOME zsh vim git ack
