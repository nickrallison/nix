# helix.nix
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_terminal";
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        auto-pairs = false;
        whitespace = {render = "all";};
        true-color = true;
      };
    };
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = {};
      };
    };
    defaultEditor = true;
  };

  home.file.".config/helix/runtime".source = "./runtime";
}
