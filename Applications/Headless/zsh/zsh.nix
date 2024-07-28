# home manager - zsh.nix

{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      sl = "eza";
      ls = "eza";
      l = "eza -l";
      la = "eza -la";

      update = "sh $HOME/.local/bin/update";
      rebuild = "sh $HOME/.local/bin/rebuild";
      
    };

    initExtra = ''
    
      neofetch
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
    '';
  };
}
