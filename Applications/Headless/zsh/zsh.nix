# home manager - zsh.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
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

      cat = "bat";

      cd = "z";

      sed = "perl -pe";

      sedi = "perl -p -i -e";

      man = "tldr";

      update = "sh $HOME/.local/bin/update";
      rebuild = "sh $HOME/.local/bin/rebuild";
    };

    initExtra = ''

      if [[ "$TMUX" == "" ]]; then
        tmux new-session -A -s home
      fi

      neofetch
      eval "$(zoxide init zsh)"
      eval "$(atuin init zsh)"
      eval "$(starship init zsh)"
    '';
  };
}
