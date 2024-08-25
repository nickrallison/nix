# headless.nix
{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    # Nice Packages
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.fzf
    pkgs.fastfetch
    pkgs.delta
    pkgs.gitui
    pkgs.neovim
    pkgs.ffmpeg_7-headless
    pkgs.btop

    # Dev Packages
    pkgs.alejandra
    pkgs.nil
    pkgs.marksman
    pkgs.taplo
    pkgs.yaml-language-server
    pkgs.nodePackages_latest.bash-language-server
    pkgs.llvmPackages_12.clang-tools
    pkgs.pandoc
    pkgs.docker_27
    pkgs.docker-compose
  ];
}
