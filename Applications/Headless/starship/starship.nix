{ home, ... }:
{
  home.file."starship.toml".source = copy "starship.toml";

  programs.starship = {
    enable = true;
  };
}
