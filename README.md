# .files

For Arch with i3

#### Screenshot

![Neovim](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/nvim.png "Neovim")
![Desktop](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/desktop.png "desktop")

### Installation

#### Symlink dotfiles and run installation script

```zsh
mkdir ~/projects
```

```zsh
git clone https://github.com/davidkariuki/dotfiles.git ~/projects/dotfiles
```

```zsh
cd ~/projects/dotfiles && ./install.sh
```

Start a new zsh session to pick up the symlinked config

#### Ruby & tmuxinator

```zsh
rbenv install 3.1.2
```

```zsh
rbenv global 3.1.2
```

```zsh
gem install tmuxinator
```
