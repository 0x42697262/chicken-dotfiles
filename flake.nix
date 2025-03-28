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
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        modules = [
          pkgs.antora
          {
            home = {
              homeDirectory = "/home/birb";
              username = "birb";
              stateVersion = "24.11";
            };
          }
        ];
      };
    };
  };
}
