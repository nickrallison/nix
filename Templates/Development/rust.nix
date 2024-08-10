# headless.nix
{
  config,
  pkgs,
  ...
}: {
  # imports = [
  #   ../Applications/Headless/zsh/zsh.nix
  #   ../Applications/Headless/helix/helix.nix
  #   ../Applications/Headless/starship/starship.nix
  #   ../Applications/Headless/tmux/tmux.nix
  #   ../Applications/Headless/git/git.nix
  #   ../Applications/Headless/atuin/atuin.nix
  #   ../Applications/Headless/zoxide/zoxide.nix
  # ];

  home.packages = [
    # Dev Tools
    pkgs.rustc
    pkgs.cargo
    pkgs.rustfmt
    pkgs.rust-analyzer
    pkgs.clippy

    # Conditionally include gcc_multi
    # (
    #   if !pkgs.stdenv.isAarch64 || !pkgs.stdenv.isDarwin
    #   then pkgs.gcc_multi
    #   # need a useless package
    #   else pkgs.gnugrep
    # )
    (pkgs.lib.optional (!pkgs.stdenv.isAarch64 || !pkgs.stdenv.isDarwin) pkgs.gcc_multi)
  ];
}
