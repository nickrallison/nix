# home manager - zsh.nix

{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      sl = "exa";
      ls = "exa";
      l = "exa -l";
      la = "exa -la";
    };

    initExtra = ''
      bindkey '^ ' autosuggest-accept
      eval $(thefuck --alias)
      autopair-init
                              '';



  # Scripts
  home.file.".config/zsh/scripts".source = ./files/scripts;
  home.file.".config/zsh/scripts".recursive = true;
}
