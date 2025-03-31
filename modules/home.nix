{ pkgs, config, ... }: {
  programs.home-manager.enable = true;
  home = {
    homeDirectory = "/home/birb";
    username = "birb";
    stateVersion = "24.11";
    packages = with pkgs; [ antora tree firefox vesktop ];
  };
  xdg.configFile = {
    "fish" = {
      source = config.lib.file.mkOutOfStoreSymlink "./configs/fish";
      recursive = true;
    };
  };
}
