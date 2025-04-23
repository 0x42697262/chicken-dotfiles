{ config, lib, ... }:
let
  configNames = [ "fish" "nvim" "btop" "kitty" "git" "mako" "gopass" "hypr" ];
  homeConfigNames = [ ".gnupg/gpg-agent.conf" ".ssh/config" ];
  mkConfig = name: {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.config/home-manager/configs/.config/${name}";
    recursive = true;
  };

  mkHomeConfig = filepath: {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.config/home-manager/configs/${filepath}";
    force = true;
  };
in
{
  xdg.configFile = lib.genAttrs configNames mkConfig;
  home.file = lib.genAttrs homeConfigNames mkHomeConfig;
}
