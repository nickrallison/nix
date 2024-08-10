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
    pkgs.verilator
  ];
}
