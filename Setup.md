# Darwin:
...

# WSL

## Prerequisites

```sh
# Basic Setup
nix-shell -p git
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/nickrallison/nix.git
cd nix
mkdir -p ./Systems/WSL
cp /etc/nixos/* ./Systems/WSL/

# First Install Build
sudo nixos-rebuild switch --flake .#WSL 
```
