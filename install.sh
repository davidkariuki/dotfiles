#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$DOTFILES/home"

info()  { printf '\n\033[1;34m==>\033[0m %s\n' "$*"; }
warn()  { printf '\033[1;33mwarning:\033[0m %s\n' "$*" >&2; }

link_one() {
  local src="$1" dest="$2"

  mkdir -p "$(dirname "$dest")"

  # Preserve an existing real file/directory instead of silently replacing it.
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    warn "backing up $dest -> $dest.bak"
    mv "$dest" "$dest.bak"
  fi

  ln -sfn "$src" "$dest"
}

unlink_one() {
  local dest="$1" target

  [ -L "$dest" ] || return 0
  target="$(readlink "$dest")"

  case "$target" in
    "$DOTFILES"/*) rm "$dest" ;;
  esac
}

# Hyprland needs Omarchy's stock files to stay in place, so these are linked
# individually instead of replacing the whole ~/.config/hypr directory.
link_hypr() {
  local hypr="$HOME/.config/hypr" src

  if [ -L "$hypr" ]; then
    case "$(readlink "$hypr")" in
      "$DOTFILES"/*) rm "$hypr" ;;
      *) warn "backing up $hypr -> $hypr.bak"; mv "$hypr" "$hypr.bak" ;;
    esac
  fi

  mkdir -p "$hypr"

  # Keep (or restore) Omarchy's stock files; only the personal ones are linked.
  if [ -d /usr/share/omarchy/config/hypr ]; then
    for stock in /usr/share/omarchy/config/hypr/* /usr/share/omarchy/config/hypr/.[!.]*; do
      [ -e "$stock" ] || continue
      [ -e "$HOME_DIR/.config/hypr/$(basename "$stock")" ] && continue
      [ -e "$hypr/$(basename "$stock")" ] || cp "$stock" "$hypr/"
    done
  fi

  for src in "$HOME_DIR/.config/hypr"/*; do
    [ -e "$src" ] || continue
    link_one "$src" "$hypr/$(basename "$src")"
  done
}

unlink_hypr() {
  local hypr="$HOME/.config/hypr" src

  if [ -L "$hypr" ]; then
    case "$(readlink "$hypr")" in
      "$DOTFILES"/*) rm "$hypr"; return ;;
    esac
  fi

  for src in "$HOME_DIR/.config/hypr"/*; do
    [ -e "$src" ] || continue
    unlink_one "$hypr/$(basename "$src")"
  done
}

# Neovim follows the same pattern: Omarchy owns the stock config, while this
# repo only links personal overrides on top. macOS gets a minimal bootstrap.
link_nvim() {
  local nvim="$HOME/.config/nvim" src rel

  if [ -L "$nvim" ]; then
    case "$(readlink "$nvim")" in
      "$DOTFILES"/*) rm "$nvim" ;;
      *) warn "backing up $nvim -> $nvim.bak"; mv "$nvim" "$nvim.bak" ;;
    esac
  fi

  mkdir -p "$nvim"

  # Restore Omarchy's stock Neovim files, except the ones this repo overrides.
  if [ -d /etc/skel/.config/nvim ]; then
    while IFS= read -r -d '' src; do
      rel="${src#/etc/skel/.config/nvim/}"
      [ -e "$HOME_DIR/.config/nvim/$rel" ] && continue
      [ -e "$nvim/$rel" ] && continue
      mkdir -p "$(dirname "$nvim/$rel")"
      cp -a "$src" "$nvim/$rel"
    done < <(find /etc/skel/.config/nvim \( -type f -o -type l \) -print0)
  fi

  # macOS has no Omarchy Neovim package; provide the entry point manually.
  if [ ! -e "$nvim/init.lua" ]; then
    printf '%s\n' '-- bootstrap lazy.nvim and LazyVim' 'require("config.lazy")' > "$nvim/init.lua"
  fi

  while IFS= read -r -d '' src; do
    rel="${src#$HOME_DIR/.config/nvim/}"
    link_one "$src" "$nvim/$rel"
  done < <(find "$HOME_DIR/.config/nvim" -type f -print0)
}

unlink_nvim() {
  local nvim="$HOME/.config/nvim" src rel

  if [ -L "$nvim" ]; then
    case "$(readlink "$nvim")" in
      "$DOTFILES"/*) rm "$nvim"; return ;;
    esac
  fi

  while IFS= read -r -d '' src; do
    rel="${src#$HOME_DIR/.config/nvim/}"
    unlink_one "$nvim/$rel"
  done < <(find "$HOME_DIR/.config/nvim" -type f -print0)
}

link_dotfiles() {
  info "Linking dotfiles from $HOME_DIR"

  # ~/.zshrc, ~/.gitconfig, ...
  for src in "$HOME_DIR"/.[!.]*; do
    [ -e "$src" ] || continue
    [ "$(basename "$src")" = ".config" ] && continue
    link_one "$src" "$HOME/$(basename "$src")"
  done

  # ~/.config/foot, ~/.config/tmux, ...
  for src in "$HOME_DIR/.config"/*; do
    [ -e "$src" ] || continue
    case "$(basename "$src")" in
      hypr|nvim) continue ;;
    esac
    link_one "$src" "$HOME/.config/$(basename "$src")"
  done

  link_hypr
  link_nvim
}

unlink_dotfiles() {
  info "Removing dotfile symlinks"

  for src in "$HOME_DIR"/.[!.]*; do
    [ -e "$src" ] || continue
    [ "$(basename "$src")" = ".config" ] && continue
    unlink_one "$HOME/$(basename "$src")"
  done

  for src in "$HOME_DIR/.config"/*; do
    [ -e "$src" ] || continue
    case "$(basename "$src")" in
      hypr|nvim) continue ;;
    esac
    unlink_one "$HOME/.config/$(basename "$src")"
  done

  unlink_hypr
  unlink_nvim
}

install_packages() {
  if [[ "$OSTYPE" == darwin* ]]; then
    info "Installing macOS packages"

    if ! command -v brew >/dev/null 2>&1; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    if [ -x /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    brew bundle --file "$DOTFILES/Brewfile"
  elif [[ "$OSTYPE" == linux* ]]; then
    info "Installing the few packages Omarchy doesn't ship"

    if command -v omarchy >/dev/null 2>&1; then
      omarchy pkg add zsh lf github-cli firefox ruby-bundler
    else
      sudo pacman -S --needed --noconfirm zsh lf github-cli firefox ruby-bundler
    fi
  else
    warn "Unsupported platform: $OSTYPE"
  fi
}

configure() {
  info "Configuring zsh"

  if ! command -v zsh >/dev/null 2>&1; then
    warn "zsh is not installed; skipping shell setup"
    return
  fi

  if [[ "$SHELL" != *zsh* ]]; then
    chsh -s "$(command -v zsh)"
  fi

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    KEEP_ZSHRC=yes sh -c \
      "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi

  local custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

  if [ ! -d "$custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git \
      "$custom/plugins/zsh-autosuggestions"
  fi

  if [ ! -d "$custom/plugins/F-Sy-H" ]; then
    git clone https://github.com/z-shell/F-Sy-H.git "$custom/plugins/F-Sy-H"
  fi

  if [ ! -d "$custom/plugins/zsh-vi-mode" ]; then
    git clone https://github.com/jeffreytse/zsh-vi-mode.git \
      "$custom/plugins/zsh-vi-mode"
  fi

  info "Installing tmux plugins"

  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    mkdir -p "$HOME/.tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  fi

  if command -v tmux >/dev/null 2>&1; then
    tmux start-server \; set-environment -g TMUX_PLUGIN_MANAGER_PATH "$HOME/.tmux/plugins" 2>/dev/null || true
    "$HOME/.tmux/plugins/tpm/bin/install_plugins" || true
  fi

  info "Installing runtimes with mise"

  if command -v mise >/dev/null 2>&1; then
    if [[ "$OSTYPE" == darwin* ]]; then
      mise use -g node@latest
    else
      # Omarchy manages ~/.config/mise/config.toml; don't overwrite it.
      mise install
    fi
  else
    warn "mise is not installed; skipping runtime setup"
  fi
}

usage() {
  cat <<'EOF'
Usage: ./install.sh [command]

  all        Install packages, link dotfiles, configure shell (default)
  packages   Install packages only
  link       Link dotfiles only
  unlink     Remove dotfile symlinks
  configure  Configure shell and runtimes only
EOF
}

case "${1:-all}" in
  all)
    install_packages
    link_dotfiles
    configure
    ;;
  packages)
    install_packages
    ;;
  link)
    link_dotfiles
    ;;
  unlink)
    unlink_dotfiles
    ;;
  configure)
    configure
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    usage
    exit 1
    ;;
esac
