if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi
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
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

# Autosuggestions
if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting MUST be near the end
if [[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Starship prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# General
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons=auto'
    alias ll='eza -lah --icons=auto --group-directories-first'
    alias tree='eza --tree --icons=auto'
else
    alias ll='ls -lah'
fi

# Arch
alias update='sudo pacman -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

#Cat
if command -v bat >/dev/null 2>&1; then
    alias cat='bat --paging=never'
fi

#Toolbox
alias toolbox='distrobox enter core-toolbox'

# Bitwarden SSH Agent
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
