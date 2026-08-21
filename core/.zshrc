# -----------------------------
# Voidbound Zsh Configuration
# -----------------------------

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Better directory behavior
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|=*' \
  'l:|=* r:|=*'

# Colors for completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Useful keybindings
bindkey -e

# Ctrl+Left / Ctrl+Right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Home / End
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Delete
bindkey '^[[3~' delete-char

# fzf
source <(fzf --zsh)

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting MUST be near the end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt
eval "$(starship init zsh)"

# General
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='eza --icons=auto'
alias ll='eza -lah --icons=auto --group-directories-first'
alias tree='eza --tree --icons=auto'

# Arch
alias update='sudo pacman -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
# Cat
alias cat='bat --paging=never'


# Bitwarden SSH Agent
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
