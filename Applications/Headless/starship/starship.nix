{
  xdg.configFile."starship.toml".source = copy "starship.toml";

  programs.starship = {
    enable = true;
  };
}
