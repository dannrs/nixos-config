{
  description = "flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
   };

   nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
	inherit inputs system;
      };
      modules = [ 
        ./system/configuration.nix
        inputs.disko.nixosModules.disko
	home-manager.nixosModules.home-manager {
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.extraSpecialArgs = {
	    inherit inputs;
	  };
	  home-manager.users."dann".imports = [
	    inputs.nix-flatpak.homeManagerModules.nix-flatpak
	    ./home
	  ];
	}
      ];
    };
  };
}
