{
  description = "0x42697262's Home manager configurations using Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
        modules = [{
          home = {
            homeDirectory = "/home/birb";
            username = "birb";
            stateVersion = "24.11";
            packages = [ nixpkgs.antora nixpkgs.tree ];
          };
        }];
      };
    };
  };
}
