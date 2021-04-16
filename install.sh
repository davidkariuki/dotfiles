#!/bin/sh
ln -fs "$(pwd)/shell/.gitconfig" ~/.gitconfig
ln -fs "$(pwd)/shell/.zshrc" ~/.zshrc
ln -fs "$(pwd)/shell/.p10k.zsh" ~/.p10k.zsh
ln -fs "$(pwd)/shell/.tmux.conf" ~/.tmux.conf
ln -fs "$(pwd)/shell/kitty.conf" ~/.config/kitty/kitty.conf
ln -fs "$(pwd)/shell/tmuxinator/dotfiles.yml" ~/.config/tmuxinator/dotfiles.yml
cp -rsf "$(pwd)/nvim/" ~/.config/
