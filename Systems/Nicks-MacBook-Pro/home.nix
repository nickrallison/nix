# home.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../Applications/Headless/zsh/zsh.nix
    ../../Applications/Headless/helix/helix.nix
    ../../Applications/Headless/starship/starship.nix
    ../../Applications/Headless/tmux/tmux.nix
    ../../Applications/Headless/git/git.nix
    ../../Applications/Headless/atuin/atuin.nix
    ../../Applications/Headless/zoxide/zoxide.nix

    ../../Applications/Gui/alacritty/alacritty.nix

    ../../Templates/Development/rust.nix
  ];

  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Basic Packages
    pkgs.wget
    pkgs.tree
    pkgs.perl
    pkgs.python3
    pkgs.fastfetch

    # Server & Sync
    pkgs.borgbackup
    pkgs.rclone

    # Replacements
    pkgs.eza
    pkgs.zoxide
    pkgs.fd
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.fzf
    pkgs.gitui
    pkgs.ncdu

    pkgs.ffmpeg_7-headless
    pkgs.pandoc

    # Dev Packages
    pkgs.alejandra
    pkgs.nil
    pkgs.marksman
    pkgs.taplo
    pkgs.yaml-language-server
    pkgs.nodePackages_latest.bash-language-server

    # Fonts
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})

    # DEPR
    # pkgs.file # contains libmagic
    # pkgs.llvmPackages_12.clang-tools

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # "starship.toml".source = ../../Applications/Headless/starship/starship.toml;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/davish/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "hx";
    HOME = /Users/nick;
    LOG_DIR = /Users/nick/Logs;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
