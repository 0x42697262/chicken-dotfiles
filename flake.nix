{
  description = "0x42697262's Home manager configurations using Flakes";

  inputs = {
    nixpkgs.url = "flake:nixpkgs";
    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, homeManager }: {
    homeConfigurations = {
      "birb@QuarkPenguin" = homeManager.lib.homeManagerConfiguration {
        configuration = {pkgs, ...}: {
          programs.home-manager.enable = true;
          home.packages = [
            pkgs.antora
          ];
        };

        # extraSpecialArgs = {
        #   inherit deploy-rs;
        # };
        system = "x86_64-linux";
        homeDirectory = "/home/birb";
        username = "birb";
        stateVersion = "24.11";
      };
    };
  };
}
