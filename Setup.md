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

Initialize Tailscale
Initialize Atuin
