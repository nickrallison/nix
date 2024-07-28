# Darwin:
...


# WSL

## Prerequisites

Make sure you have a nerd font installed

## Installation

```sh
# Basic Setup from git
nix-shell -p git
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/nickrallison/nix.git
cd nix

# Linking rebuild commands
mkdir -p $HOME/.local/bin
ln -s $HOME/.config/Systems/WSL/rebuild $HOME/.local/rebuild
ln -s $HOME/.config/Systems/WSL/update  $HOME/.local/update

# First Install Build
sudo nixos-rebuild switch --flake .#WSL 
```

## Post Setup

1. Setup git with credentials
```sh
git config --global credential.helper store
git add .
git commit -m "init system"
git push
```
 - System will prompt for credentials, afterwards they should be saved

Initialize Tailscale
```sh
sudo tailscale up
```

Initialize Atuin
```sh
atuin login
atuin sync -f
```
