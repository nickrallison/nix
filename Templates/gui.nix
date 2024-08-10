# headless.nix
{
  config,
  pkgs,
  ...
}: {
  # imports = [
  #   ../Applications/Headless/zsh/zsh.nix
  # ];

  home.packages = [
    # Basic Packages
    # pkgs.wget
    # pkgs.tree
    # pkgs.perl

    # Niceties
    pkgs.zed-editor
    # pkgs.ripgrep-all
    # pkgs.fzf
    # pkgs.fastfetch
    # pkgs.delta
    # pkgs.gitui
    # pkgs.neovim

    # Replacements
    # pkgs.eza
    # pkgs.zoxide
    # pkgs.bat
    # pkgs.fd
    # pkgs.tldr

    # Dev Tools
    # pkgs.rust-analyzer
    # pkgs.clippy

    # Specific Tools
    # pkgs.alejandra
    # pkgs.nil
    # pkgs.marksman
    # pkgs.taplo
    # pkgs.yaml-language-server
    # pkgs.nodePackages_latest.bash-language-server
  ];
}
