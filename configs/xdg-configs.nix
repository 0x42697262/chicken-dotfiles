{ config, lib, ... }:
let
  configNames = [ "fish" "nvim" "btop" "kitty" "git" "mako" ];
  mkConfig = name: {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.config/home-manager/configs/${name}";
    recursive = true;
  };
in { xdg.configFile = lib.genAttrs configNames mkConfig; }
