{ pkgs, ... }: {
  programs.home-manager.enable = true;
  home = {
    homeDirectory = "/home/birb";
    username = "birb";
    stateVersion = "24.11";
    packages = with pkgs; [ antora tree firefox vesktop ];
  };
}
