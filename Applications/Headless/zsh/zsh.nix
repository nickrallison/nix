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
      rm = "rm -i";
      mydate = "date +\"%d-%m-%y\"";

      borgmnt = "mkdir -p ~/borg-mnt; borg mount nick@100.82.178.25:/home/nick/OneDrive/Backups/Cloud ~/borg-mnt; realpath ~/borg-mnt";
      borgumnt = "borg umount ~/borg-mnt; rmdir ~/borg-mnt";

      update = "sh $HOME/.local/bin/update";
      rebuild = "sh $HOME/.local/bin/rebuild";

      nixidea = "nix develop --command '/Users/nick/Applications/IntelliJ IDEA Ultimate.app/Contents/MacOS/idea'";
      nixclion = "nix develop --command '/Users/nick/Applications/CLion.app/Contents/MacOS/clion'";

      nixgo = "nix develop --command '/Users/nick/Applications/GoLand.app/Contents/MacOS/goland'";

      dev = "nix develop -c zsh";
      devdir = "git submodule update --init --recursive; cd ./nix; nix develop -c zsh; cd ..";

      sshubuntu = "ssh nick@100.82.178.25";
      sshwin = "ssh desktop-oj2v1nk\\\\nick@100.110.130.8";
      sshcpsc = "ssh nicholas.allison@100.101.223.106";
      sshengg = "ssh nallison@100.88.166.10";
      tsshcpsc = "tailscale ssh nicholas.allison@100.101.223.106";
      tsshengg = "tailscale ssh nallison@100.88.166.10";
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
      export SSH_AUTH_SOCK=/Users/nick/.bitwarden-ssh-agent.sock
      # export PATH="$PATH:/etc/profiles/per-user/nick/bin"
      fastfetch
      # eval "$(zoxide init zsh)"
      # eval "$(atuin init zsh)"
      # eval "$(starship init zsh)"

      if [ -e "~/.local/bin" ]; then
        export PATH="$PATH:~/.local/bin"
      fi
      
      if [ -e "/usr/local/cuda-12.9/bin" ]; then
        export PATH=$PATH:/usr/local/cuda-12.9/bin
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-12.9/lib64
      fi


    '';
  };
}
