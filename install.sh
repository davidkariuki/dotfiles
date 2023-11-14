#!/usr/bin/env bash

mkdir -p ~/projects
git clone https://github.com/davidkariuki/dotfiles.git ~/projects/dotfiles

cd ~/projects/dotfiles

./install-packages
./link
./configure
