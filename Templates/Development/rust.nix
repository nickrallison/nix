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
    # Dev Tools
    pkgs.rustc
    pkgs.cargo
    pkgs.rustfmt
    pkgs.rust-analyzer
    pkgs.clippy

    # Conditionally include gcc_multi
    (
      if !pkgs.stdenv.isAarch64 || !pkgs.stdenv.isDarwin
      then pkgs.gcc_multi
      # need a useless package
      else pkgs.gnugrep
    )
  ];
}
