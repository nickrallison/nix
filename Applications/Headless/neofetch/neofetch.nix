{ pkgs, ... }:
{
  
  home.packages = [
    pkgs.neofetch
  ];
  home.file.neofetch_config = {
    source = ./config.conf;
    target = ".config/neofetch/config.conf";
  };
}

