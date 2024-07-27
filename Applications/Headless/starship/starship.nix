{
  programs.starship = {
    enable = true;
    settings = {
      format = "[](#A277FF)$directory[](bg:#FF6767 fg:#A277FF)$git_branch$git_commit$git_state$git_metrics$git_status[](fg:#FF6767 bg:#61FFCA)$nodejs$rust$terraform[](fg:#61FFCA bg:#82E2FF)$package[ ](fg:#82E2FF)$fill[](#6D6D6D)$time[](#6D6D6D)$line_break$jobs$status$shell$character";
      command_timeout = 1000;
      directory = {
        style = "bg:#A277FF fg:#15141B";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = " ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };
      git_branch = {
        symbol = "";
        style = "bg:#FF6767 fg:#15141B";
        format = "[ $symbol $branch ]($style)";
      };
      git_status = {
        style = "bg:#FF6767 fg:#15141B";
        format = "[($all_status$ahead_behind )]($style)";
      };
      nodejs = {
        symbol = "";
        style = "bg:#61FFCA fg:#15141B";
        format = "[ $symbol ($version) ]($style)";
      };
      rust = {
        symbol = "";
        style = "bg:#61FFCA fg:#15141B";
        format = "[ $symbol ($version) ]($style)";
      };
      terraform = {
        symbol = "行";
        style = "bg:#61FFCA fg:#15141B";
        format = "[ $symbol$workspace ]($style)";
      };
      package = {
        symbol = "";
        format = "[ $symbol ($version) ]($style)";
        style = "bg:#82E2FF fg:#15141B";
      };
      gcloud = {
        disabled = true;
      };
      fill = {
        symbol = " ";
      };
      character = {
        format = " $symbol ";
        error_symbol = "[](bold red)";
      };
      time = {
        disabled = false;
        format = "[$time]($style)";
        time_format = "%-I:%M:%S %p";
        style = "bg:#6D6D6D fg:#14141B";
      };
    };
  };
}
