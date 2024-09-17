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

      sshunraid = "ssh -p 7149 'root@100.108.27.35'";
      sshnix = "ssh nick@100.118.225.61";
      sshubuntu = "ssh nick@192.168.68.73";
      sshcpsc = "ssh nicholas.allison@cslinux.ucalgary.ca";
    };

    initExtra = ''

      if [[ "$TMUX" == "" ]]; then
        tmux has-session -t $(pwd | sed 's/\./_/g') 2>/dev/null

        if [ $? != 0 ]; then
          tmux new-session -s $(pwd | sed 's/\./_/g') -c "$(pwd)"
        else
          tmux new-window -t $(pwd | sed 's/\./_/g') -c "$(pwd)"
          tmux attach-session -t $(pwd | sed 's/\./_/g')
        fi
        # tmux new-session -A -s home
      fi

      # if path exists: /Library/TeX
      if [ -d "/Library/TeX" ]; then
        export PATH="/Library/TeX/texbin:$PATH"
      fi

      if [ -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]; then
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      fi
      export PATH="$PATH:/opt/homebrew/bin"
      fastfetch
      # eval "$(zoxide init zsh)"
      # eval "$(atuin init zsh)"
      # eval "$(starship init zsh)"
    '';
  };
}
