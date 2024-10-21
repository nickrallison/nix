# home manager - zsh.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./alacritty.toml);
  };
}
