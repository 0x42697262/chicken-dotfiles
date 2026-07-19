{
  description = "0x42697262's Home Manager configurations using Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, homeManager, ... }@inputs:
    let
      mkHome = name: homeManager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./modules/home.nix ];
      };
    in {
      homeConfigurations = {
        "birb@emu" = mkHome "birb@emu";
        "birb@PlasmaPhoenix" = mkHome "birb@PlasmaPhoenix";
        "birb@QuarkPenguin" = mkHome "birb@QuarkPenguin";
      };
    };
}
