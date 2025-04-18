{ config, lib, ... }:
let
  configNames = [ "fish" "nvim" "btop" "kitty" "git" "mako" "gopass" ];
  mkConfig = name: {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.config/home-manager/configs/.config/${name}";
    recursive = true;
  };
in
{
  xdg.configFile = lib.genAttrs configNames mkConfig;

  home.file.".gnupg/gpg-agent.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.config/home-manager/configs/.gnupg/gpg-agent.conf";
    force = true;
  };
}
