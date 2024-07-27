#!/bin/sh

# setup.sh 

# setup nix flakes on macos with darwin

# 0. clone this whole repo to ${XDG_CONFIG_HOME}/nix

# 1. install nix with this command:
# sh <(curl -L https://nixos.org/nix/install)

# 2. install nix-darwin:
# nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
# ./result/bin/darwin-installer
# rm -rf ./result
# rm .nixpkgs

# 3. Add ${HOME}/.local/bin to path

cd ${HOME}/.config/nix/Systems/Nicks-MacBook-Pro;
mkdir -p ${HOME}/.local/bin
ln -s ${HOME}/.config/nix/Systems/Nicks-MacBook-Pro/rebuild ${HOME}/.local/bin/rebuild

