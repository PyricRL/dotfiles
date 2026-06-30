{
  description = "Pyric first flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        inherit system;
	modules = [ ./hosts/desktop/configuration.nix ];
      };
    };
    homeConfigurations = {
      pyric = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	modules = [ ./modules/user/home.nix ];
      };
    };
  };
}
