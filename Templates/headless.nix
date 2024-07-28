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
    pkgs.fd
    pkgs.tldr

    # Replacements
    pkgs.eza
    pkgs.zoxide
    pkgs.bat

    # Specific TOols
    pkgs.alejandra
  ];
}
