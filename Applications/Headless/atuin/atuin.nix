{
  config,
  pkgs,
  ...
}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://100.98.101.100:8888";
    };
  };
}
