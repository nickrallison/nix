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

      dev = "nix develop -c $SHELL";

      sshunraid = "ssh -p 7149 'root@192.168.68.57'";
      sshnix = "ssh nick@192.168.68.71";
      sshubuntu = "ssh nick@192.168.68.73";
    };

    initExtra = ''

      if [[ "$TMUX" == "" ]]; then
        tmux has-session -t $(pwd) 2>/dev/null

        if [ $? != 0 ]; then
          tmux new-session -s $(pwd) -c "$(pwd)"
        else
          tmux new-window -t $(pwd) -c "$(pwd)"
          tmux attach-session -t $(pwd)
        fi
        # tmux new-session -A -s home
      fi

      # if path exists: /Library/TeX
      if [ -d "/Library/TeX" ]; then
        export PATH="/Library/TeX/texbin:$PATH"
      fi


      fastfetch
      # eval "$(zoxide init zsh)"
      # eval "$(atuin init zsh)"
      # eval "$(starship init zsh)"
    '';
  };
}
