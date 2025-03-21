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
      mydate = "date +\"%d-%m-%y\"";

      borgmnt = "mkdir -p ~/borg-mnt; borg mount root@100.108.27.35:/mnt/remotes/onedrive/unraid_borg_backup ~/borg-mnt; realpath ~/borg-mnt";
      borgumnt = "borg umount ~/borg-mnt; rmdir ~/borg-mnt";

      update = "sh $HOME/.local/bin/update";
      rebuild = "sh $HOME/.local/bin/rebuild";

      nixidea = "nix develop --command '/Users/nick/Applications/IntelliJ IDEA Ultimate.app/Contents/MacOS/idea'";
      nixgo = "nix develop --command '/Users/nick/Applications/GoLand.app/Contents/MacOS/goland'";

      dev = "nix develop -c zsh";
      devdir = "git submodule update --init --recursive; cd ./nix; nix develop -c zsh; cd ..";

      sshunraid = "ssh 'root@100.108.27.35'";
      sshnix = "ssh nick@100.118.225.61";
      sshubuntu = "ssh nick@192.168.68.73";
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
      export SSH_AUTH_SOCK=/Users/nick/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
      # export PATH="$PATH:/etc/profiles/per-user/nick/bin"
      fastfetch
      # eval "$(zoxide init zsh)"
      # eval "$(atuin init zsh)"
      # eval "$(starship init zsh)"

      if [ -e "~/.local/bin" ]; then
        export PATH="$PATH:~/.local/bin"
      fi
    '';
  };
}
