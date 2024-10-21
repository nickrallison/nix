{
  config,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    # pkgs.vim
    # pkgs.hello
    pkgs.mkalias
  ];

  homebrew = {
    enable = true;
    casks = [
      # "fileicon"
    ];
  };

  system.activationScripts.postRebuild = {
    script = "/etc/your-script.sh";
    environment = "HOME=$HOME";
  };

  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
    # hmenv = pkgs.buildEnv {
    #   name = "hm-applications";
    #   paths = config.environment.systemPackages;
    #   pathsToLink = "$HOME/Applications/Home Manager Apps";
    # };
  in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done

      # Set up hm applications.
      echo "/Users/nick/Applications/Home Manager Apps" >&2
      # rm -rf /Applications/Nix\ Apps
      # mkdir -p /Applications/Nix\ Apps
      # cd "/Users/nick/Applications/Home Manager Apps/"; find . -name "*" + |

      cd "/Users/nick/Applications/Home Manager Apps/"; find . -name "*" |
      while read src; do
        path="/Users/nick/Applications/Home Manager Apps/$src"
        name=$(basename "$path" | sed 's/.app//g' | sed 's@/./@/@g')
        lower_name=$(echo $name | awk '{print tolower($0)}')
        if [ -e "$path" ]; then
          echo here 1
          [ -d "$path" ] && \
          if [ -e "/Users/nick/.config/nix/Systems/Nicks-MacBook-Pro/Icons/$name.icns" ]; then
            echo $lower_name
            echo "$path/Contents/Resources/$name.icns"
            # cp /Users/nick/.config/nix/Systems/Nicks-MacBook-Pro/Icons/$name.icns "$path/Contents/Resources/$name.icns"
            cp /Users/nick/.config/nix/Systems/Nicks-MacBook-Pro/Icons/$name.icns "$path/Contents/Resources/$lower_name.icns"
            echo 'cp /Users/nick/.config/nix/Systems/Nicks-MacBook-Pro/Icons/$name.icns "$path/Contents/Resources/$lower_name.icns"'
            echo cp /Users/nick/.config/nix/Systems/Nicks-MacBook-Pro/Icons/$name.icns "$path/Contents/Resources/$lower_name.icns"
          fi
        fi
      done

    '';

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.nick = {
    name = "nick";
    home = "/Users/nick";
  };
}
