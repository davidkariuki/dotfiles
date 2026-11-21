# Shell setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
DISABLE_MAGIC_FUNCTIONS=true

plugins=(
  zsh-vi-mode
  git
  ruby
  node
  docker
  docker-compose
  python
  sudo
  zsh-autosuggestions
  F-Sy-H
)

source "$ZSH/oh-my-zsh.sh"

# Prompt
eval "$(starship init zsh)"

# Secrets (tokens, API keys, etc.)
if [ -e "$HOME/.secrets" ]; then
  source "$HOME/.secrets"
fi

# Locale
export LANGUAGE=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8

# Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Let bat follow the terminal theme instead of pinning an old theme.
export BAT_THEME="ansi"

# Aliases
alias cat="bat"
alias vim="nvim"
alias lg="lazygit"
alias ls="eza --icons"

# Paths
export PATH="$HOME/.local/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"

# mise
eval "$(mise activate zsh)"
