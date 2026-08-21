# Voidbound Dotfiles

Personal Arch Linux dotfiles managed with Git and GNU Stow.

## Systems

### voidbound-core

Arch Linux + KDE Plasma.

Uses:

- `common`
- `core`

### voidbound-nova

Arch Linux + HyDE / Hyprland.

Uses:

- `common`
- `nova`

## Structure

    dotfiles/
    ├── common/
    │   └── .gitconfig
    ├── core/
    │   ├── .zshrc
    │   ├── .config/starship.toml
    │   ├── .config/konsolerc
    │   └── .local/share/konsole/
    └── nova/
        └── .config/
            ├── hypr/hyprland.lua
            └── zsh/user.zsh

## Install

Install dependencies:

    sudo pacman -S --needed git stow

Clone:

    mkdir -p ~/Projects
    cd ~/Projects
    git clone git@github.com:zero9tracex4/dotfiles.git
    cd dotfiles

### Core

    stow -t "$HOME" common
    stow -t "$HOME" core

### Nova

Install HyDE first, then:

    stow -t "$HOME" common
    stow -t "$HOME" nova

Nova tracks only personal HyDE overrides, not HyDE-managed base files.

## Updating

    cd ~/Projects/dotfiles
    git status
    git add -A
    git commit -m "Describe change"
    git push

On another machine:

    cd ~/Projects/dotfiles
    git pull --ff-only
