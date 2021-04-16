#!/bin/sh
cp -rsf "$(pwd)/nvim/" ~/.config/
ln -fs "$(pwd)/shell/.gitconfig" ~/.gitconfig
ln -fs "$(pwd)/shell/.zshrc" ~/.zshrc
ln -fs "$(pwd)/shell/.p10k.zsh" ~/.p10k.zsh
ln -fs "$(pwd)/shell/.tmux.conf" ~/.tmux.conf
ln -fs "$(pwd)/shell/kitty.conf" ~/.config/kitty/kitty.conf

for file in "$(pwd)"/shell/tmuxinator/*.yml; do 
  filename=$(basename "$file")
  ln -fs "$file" ~/.config/tmuxinator/"$filename"
done
