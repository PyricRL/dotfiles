{
  description = "Pyric first flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:sodiboo/niri-flake";

    mnw.url = "github:Gerg-L/mnw";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qml-niri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };

    oshot.url = "github:PyricRL/oshot";

    atk-tool.url = "github:PyricRL/atk-tool";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [ 
          ./hosts/desktop/configuration.nix 
          inputs.atk-tool.nixosModules.default
        ];
      };
    };
    homeConfigurations = {
      pyric = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./modules/user/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
