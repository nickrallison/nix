# headless.nix
{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    # Basic Packages
    pkgs.wget
    pkgs.tree
    pkgs.perl

    # Niceties
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.fzf
    pkgs.neofetch
    pkgs.delta
    pkgs.gitui

    # Replacements
    pkgs.eza
    pkgs.zoxide
    pkgs.bat
    pkgs.fd
    pkgs.tldr

    # Dev Tools
    pkgs.cargo

    # Specific Tools
    pkgs.alejandra
  ];
}
