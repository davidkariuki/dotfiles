# .files

Instructions are for Arch-based distributions.

#### Screenshot

![Neovim](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/nvim.png "Neovim")
![Kitty](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/terminal.png "Kitty")

## Binaries

### Base

Enable the AUR first

```zsh
sudo pacman -S --needed base-devel yay
yay -S --needed ttf-fira-code zsh tmux bat neofetch kitty lazygit github-cli \
npm go neovim-nightly-bin bottom-bin rbenv ruby-build ripgrep shellcheck direnv
```

#### oh-my-zsh

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Github CLI

```zsh
gh auth login
```

## Config dirs

```zsh
mkdir -p ~/.tmux/plugins ~/.npm-global ~/.yarn-global ~/.config/tmuxinator
```

#### Dotfile symlinks

```zsh
gh repo clone davidkariuki/dotfiles
cd dotfiles && ./install.sh
```

Log out to pick up the symlinked config

## Plugin setup

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
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

#### Tmux plugins

```zsh
gem install tmuxinator
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
yarn global add typescript prettier eslint_d n
```

#### node

```zsh
n latest
```
