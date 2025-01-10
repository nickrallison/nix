# headless.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../Applications/Headless/zsh/zsh.nix
    ../Applications/Headless/helix/helix.nix
    ../Applications/Headless/starship/starship.nix
    ../Applications/Headless/tmux/tmux.nix
    ../Applications/Headless/git/git.nix
    ../Applications/Headless/atuin/atuin.nix
    ../Applications/Headless/zoxide/zoxide.nix
  ];

  home.packages = [
    # Basic Packages
    pkgs.wget
    pkgs.tree
    pkgs.perl
    pkgs.python313
    pkgs.python312Packages.pip
    pkgs.file # contains libmagic
    pkgs.nodejs_22
    pkgs.fastfetch
    pkgs.borgbackup
    pkgs.rclone
    pkgs.dos2unix
    pkgs.ripgrep-all

    # Replacements
    pkgs.eza
    pkgs.zoxide
    pkgs.bat
    pkgs.fd
    pkgs.tldr
    pkgs.ripgrep
    pkgs.android-tools

    # Replacements
    pkgs.zig
  ];
}
