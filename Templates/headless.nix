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

    # Niceties
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.fzf
    pkgs.fastfetch
    pkgs.delta
    pkgs.gitui
    pkgs.neovim

    # Replacements
    pkgs.eza
    pkgs.zoxide
    pkgs.bat
    pkgs.fd
    pkgs.tldr

    # Dev Tools
    pkgs.rustc
    pkgs.cargo
    pkgs.rustfmt
    pkgs.rust-analyzer
    pkgs.clippy

    # pkgs.gcc_multi
    # Conditionally include gcc_multi
    (
      if !pkgs.stdenv.isAarch64 || !pkgs.stdenv.isDarwin
      then pkgs.gcc_multi
      # need a useless package
      else pkgs.gnugrep
    )

    # Specific Tools
    pkgs.alejandra
    pkgs.nil
    pkgs.marksman
    pkgs.taplo
    pkgs.yaml-language-server
    pkgs.nodePackages_latest.bash-language-server
  ];
}
