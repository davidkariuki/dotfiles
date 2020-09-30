### dotfiles

Instructions are for Ubuntu-based distributions.

#### Screenshot

![Screenshot](https://github.com/davidkariuki/dotfiles/raw/master/screenshots/1.png "Screenshot")

#### Binaries

```zsh
sudo apt-get install -y zsh vim-gtk3 tmux tig hub bat snapd
sudo snap install --edge nvim --classic
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

- node

```zsh
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
```

```zsh
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
```

- Eslint, prettier & yarn

```zsh
npm i -g eslint prettier yarn
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
