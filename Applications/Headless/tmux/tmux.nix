{
  programs.tmux = {
    enable = true;
    extraConfig = '' 
      
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix

      set -sg escape-time 10
      set -g mouse on
      set-option -g history-limit 20000
  '';
  }
}
