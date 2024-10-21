# home manager - zsh.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
  };
}
