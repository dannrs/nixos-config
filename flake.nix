{
  description = "dannrs flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
    #use fork (because of the 'stylix.image' null bug) until this pull request is merged
    #https://github.com/danth/stylix/pull/941
    stylix = {
      url = "github:merrkry/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    # stylix = {
    #   url = "github:danth/stylix";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     home-manager.follows = "home-manager";
    #   };
    # };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in {
    #overlays = import ./overlays { inherit inputs; };
    nixosConfigurations.nixos = lib.nixosSystem {
      specialArgs = {
        inherit inputs outputs system;
      };
      modules = [
        ./system
        inputs.disko.nixosModules.disko
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = {
            inherit inputs outputs system;
          };
          home-manager.users."dann".imports = [
            ./home
          ];
        }
      ];
    };
  };
}
