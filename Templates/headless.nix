# headless.nix
{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.wget
    pkgs.tree
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.alejandra
    pkgs.eza
    pkgs.fzf
    pkgs.neofetch
    pkgs.zoxide
  ];
}
