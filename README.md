# .files

Instructions are for Ubuntu-based distributions.

#### Screenshot

![Neovim](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/nvim.png "Neovim")
![Alacritty](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/terminal.png "Alacritty")

### Fonts

Install the font in ./font

## Binaries

### Base

```zsh
sudo apt-get install -y zsh vim-gtk3 tmux tig bat snapd
sudo snap install --edge nvim --classic
```

### Alacritty

```zsh
sudo add-apt-repository ppa:aslatter/ppa
sudo apt-get install -y alacritty
mkdir -p ~/.config/alacritty/alacritty
```

### Ripgrep

Get the latest Ripgrep [binary](https://github.com/BurntSushi/ripgrep/releases)
and install

### Github CLI

Get the latest [binary](https://github.com/cli/cli/releases), install and log
in:

```zsh
gh auth login
```

## Config

#### Nvim config

```zsh
mkdir -p ~/.config/nvim
```

#### Dotfile symlinks

```zsh
hub clone davidkariuki/dotfiles
cd dotfiles && ./install.sh
```

## Plugins

#### oh-my-zsh

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### zsh-autosuggestions

```zsh
gh repo clone zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### fast-syntax-highlighting

```zsh
gh repo clone zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

#### powerlevel10k

```zsh
gh repo clone --depth=1 romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Reboot to pick up the Zsh config

#### Tmux plugins

```zsh
mkdir -p ~/.tmux/plugins
gh repo clone tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start a new tmux session and run `C-a I`

## yarn & npm

```zsh
sudo apt install npm
mkdir ~/.npm-global
mkdir ~/.yarn-global
npm config set prefix '~/.npm-global'

npm i -g yarn
yarn config set prefix '~/.yarn-global'
```

#### yarn binaries

```zsh
yarn global add typescript eslint prettier n
```

#### node

```zsh
n latest
```
