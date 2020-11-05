### dotfiles

Instructions are for Ubuntu-based distributions.

#### Screenshot

![Neovim](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/nvim.png "Neovim")
![Alacritty](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/terminal.png "Alacritty")

#### Binaries

```zsh
sudo apt-get install -y zsh vim-gtk3 tmux tig hub bat snapd python3-pip
sudo snap install --edge nvim --classic
pip3 install python-language-server
```

Ripgrep apt installation is currently broken

```zsh
apt-get download ripgrep
sudo dpkg --force-overwrite -i ripgrep*.deb
```

- oh-my-zsh

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- zsh-autosuggestions

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- fast-syntax-highlighting

```zsh
git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

- powerlevel10k

```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

- Tmux plugins

```zsh
hub clone tmux-plugins/tpm ~/.tmux/plugins/tpm
```

- start tmux and run `C-a I`

- npm

```zsh
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
```

- Eslint, prettier, yarn & n

```zsh
npm i -g eslint prettier yarn n
```

- node

```zsh
n latest
```

#### Fonts

```zsh
hub clone ryanoasis/nerd-fonts
cd nerd-fonts && ./install.sh FiraMono
```

#### Nvim config

```zsh
mkdir -p ~/.config/nvim
```

#### Dotfile symlinks

```zsh
hub clone davidkariuki/dotfiles
cd dotfiles && ./install.sh
```
