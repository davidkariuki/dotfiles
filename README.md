# .files

Instructions are for Arch-based distributions.

#### Screenshot

![Neovim](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/nvim.png "Neovim")
![Alacritty](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/terminal.png "Alacritty")

### Fonts

Install the fonts in ./font

## Binaries

### Base

```zsh
sudo pacman -S --needed zsh tmux bat neofetch alacritty lazygit github-cli npm
yay -S --needed neovim-nightly-bin bottom rbenv ruby-build rg
```

### Github CLI

```zsh
gh auth login
```

## Config dirs

```zsh
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty/alacritty
mkdir -p ~/.tmux/plugins
mkdir ~/.npm-global
mkdir ~/.yarn-global
```

#### Dotfile symlinks

```zsh
gh repo clone davidkariuki/dotfiles
cd dotfiles && ./install.sh
```

## Plugin setup

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
git clone --depth=1 romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Reboot to pick up the Zsh config

#### Tmux plugins

```zsh
gh repo clone tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start a new tmux session and run `C-a I`

## yarn & npm

```zsh
npm config set prefix '~/.npm-global'

npm i -g yarn
yarn config set prefix '~/.yarn-global'
```

#### yarn binaries

```zsh
yarn global add typescript prettier n
```

#### node

```zsh
n latest
```
