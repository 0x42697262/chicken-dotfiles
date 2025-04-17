{ pkgs, config, ... }: {
  imports = [ ../configs/xdg-configs.nix ];

  programs.home-manager.enable = true;
  home = {
    homeDirectory = "/home/birb";
    username = "birb";
    stateVersion = "24.11";
    packages = with pkgs; [
      antora
      asciidoc-full-with-plugins
      asciidoctor-with-extensions
      tree
      vesktop
    ];
  };
}
