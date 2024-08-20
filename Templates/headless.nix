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
    pkgs.python3
    pkgs.python312Packages.pip
    pkgs.file # contains libmagic
    pkgs.nodejs_22

    # Niceties
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.fzf
    pkgs.fastfetch
    pkgs.delta
    pkgs.gitui
    pkgs.neovim
    pkgs.ffmpeg_7-headless
    pkgs.btop

    # Replacements
    pkgs.eza
    pkgs.zoxide
    pkgs.bat
    pkgs.fd
    pkgs.tldr

    # Specific Tools
    pkgs.alejandra
    pkgs.nil
    pkgs.marksman
    pkgs.taplo
    pkgs.yaml-language-server
    pkgs.nodePackages_latest.bash-language-server
    pkgs.llvmPackages_12.clang-tools
  ];
}
