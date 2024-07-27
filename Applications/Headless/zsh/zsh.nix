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
    };

    initExtra = ''
      ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    
      neofetch
      eval "$(starship init zsh)"
    '';
  };
}
