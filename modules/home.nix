{ pkgs, config, inputs, ... }: {
  imports = [
    ../configs/xdg-configs.nix
    inputs.caelestia-shell.homeManagerModules.default
  ];

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
      zathura
      xorg.xhost
      # Mesa wrapper so nix-store GUI apps (caelestia) find the host's
      # AMD Mesa drivers; drives radeonsi/iGPU and forces the Mesa EGL vendor.
      inputs.nixgl.packages.${pkgs.system}.nixGLIntel
    ];
  };

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = true;
      };
      paths.wallpaperDir = "~/画像";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
