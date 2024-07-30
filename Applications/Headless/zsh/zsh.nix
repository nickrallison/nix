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
      find = "fd";
      man = "tldr";

      update = "sh $HOME/.local/bin/update";
      rebuild = "sh $HOME/.local/bin/rebuild";

      sshunraid = "ssh -p 7149 'root@192.168.68.57'";
      sshnix = "ssh nick@100.118.225.61";
    };

    initExtra = ''

      if [[ "$TMUX" == "" ]]; then
        tmux new-session -A -s home
      fi

      fastfetch
      # eval "$(zoxide init zsh)"
      # eval "$(atuin init zsh)"
      # eval "$(starship init zsh)"
    '';
  };
}
