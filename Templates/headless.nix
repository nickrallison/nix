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

    # Niceties
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.fzf
    pkgs.neofetch
    pkgs.delta

    # Replacements
    pkgs.eza
    pkgs.zoxide
    pkgs.bat
    pkgs.fd
    pkgs.tldr

    # Specific TOols
    pkgs.alejandra
  ];
}
