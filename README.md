# .files

Instructions are for Arch-based distributions.

#### Screenshot

![Neovim](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/nvim.png "Neovim")
![Kitty](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/terminal.png "Kitty")

## Binaries

### Base

```zsh
sudo pacman -S --needed base-devel yay
```

```zsh
yay -S --needed ttf-fira-code zsh tmux bat neofetch kitty lazygit github-cli \
npm go neovim-nightly-bin bottom-bin rbenv ruby-build ripgrep shellcheck direnv slack-desktop discord
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
mkdir -p ~/projects ~/.tmux/plugins ~/.npm-global ~/.yarn-global ~/.config/tmuxinator
```

#### Dotfile symlinks

```zsh
gh repo clone davidkariuki/dotfiles ~/projects/dotfiles
```

```zsh
cd ~/projects/dotfiles && ./install.sh
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

#### Ruby

```zsh
rbenv install 3.0.1
```

```zsh
rbenv global 3.0.1
```

#### Tmux plugins

```zsh
gem install tmuxinator
```

```zsh
gh repo clone tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start a new tmux session and run `C-a I`

## yarn & npm

```zsh
npm config set prefix '~/.npm-global'
```

```zsh
npm i -g yarn
```

```zsh
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
