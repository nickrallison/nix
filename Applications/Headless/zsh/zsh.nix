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
      # cat = "bat";
      cd = "z";
      # find = "fd";
      # man = "tldr";

      borgmnt = "mkdir -p ~/borg-mnt; borg mount root@100.108.27.35:/mnt/remotes/onedrive/unraid_borg_backup ~/borg-mnt; realpath ~/borg-mnt";
      borgumnt = "borg umount ~/borg-mnt; rmdir ~/borg-mnt";

      update = "sh $HOME/.local/bin/update";
      rebuild = "sh $HOME/.local/bin/rebuild";

      dev = "nix develop -c zsh";
      devdir = "git submodule update --init --recursive; cd ./nix; nix develop -c zsh; cd ..";

      sshunraid = "ssh 'root@100.108.27.35'";
      sshnix = "ssh nick@100.118.225.61";
      sshubuntu = "ssh nick@192.168.68.73";
      sshcpsc = "ssh nicholas.allison@cslinux.ucalgary.ca";
    };

    initExtra = ''

      if [[ "$TMUX" == "" ]]; then
        # Get the current directory name
        session_name=$(basename "$PWD")

        # Check if a tmux session with the current directory name exists
        if tmux has-session -t "$session_name" 2>/dev/null; then
          # Attach to the existing session
          tmux attach-session -t "$session_name"
        else
          # Create a new session with the current directory name
          tmux new-session -s "$session_name"
        fi
      fi

      # if path exists: /Library/TeX
      if [ -d "/Library/TeX" ]; then
        export PATH="/Library/TeX/texbin:$PATH"
      fi

      if [ -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]; then
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      fi
      # if [ -e "/etc/static/bashrc" ]; then
        # source /etc/static/bashrc
      # fi
      export PATH="$PATH:/opt/homebrew/bin"
      export PATH="$PATH:/usr/local/bin"
      # export PATH="$PATH:/etc/profiles/per-user/nick/bin"
      fastfetch
      # eval "$(zoxide init zsh)"
      # eval "$(atuin init zsh)"
      # eval "$(starship init zsh)"
    '';
  };
}
