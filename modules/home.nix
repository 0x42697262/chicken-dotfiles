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
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.config/home-manager/configs/fish";
      recursive = true;
    };
  };
}
