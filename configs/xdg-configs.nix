{ config, ... }: {
  xdg.configFile = {
    "fish" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.config/home-manager/configs/fish";
      recursive = true;
    };
    "nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.config/home-manager/configs/nvim";
      recursive = true;
    };
    "btop" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.config/home-manager/configs/btop";
      recursive = true;
    };
  };
}
