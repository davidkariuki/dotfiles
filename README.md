### dotfiles

Instructions are for Ubuntu-based distributions.

#### Screenshot

![Neovim](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/nvim.png "Neovim")
![Alacritty](https://github.com/davidkariuki/dotfiles/raw/main/screenshots/terminal.png "Alacritty")

#### Binaries

```zsh
sudo apt-get install -y zsh vim-gtk3 tmux tig bat snapd
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

- yarn

```zsh
sudo apt install npm
mkdir ~/.npm-global
mkdir ~/.yarn-global
npm config set prefix '~/.npm-global'

npm i -g yarn
yarn config set prefix '~/.yarn-global'
```

- yarn binaries

```zsh
yarn global add typescript vercel eslint prettier n
```

- node

```zsh
n latest
```

#### Fonts

- Install the font in ./font

#### Nvim config

```zsh
mkdir -p ~/.config/nvim
```

### Alacritty config

```zsh
mkdir -p ~/.config/alacritty/alacritty
```

#### Dotfile symlinks

```zsh
hub clone davidkariuki/dotfiles
cd dotfiles && ./install.sh
```
