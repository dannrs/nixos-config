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
    nix-colors.url = "github:misterio77/nix-colors";
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
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    #overlays = import ./overlays { inherit inputs; };
    nixosConfigurations.nixos = lib.nixosSystem {
      specialArgs = {
        inherit inputs outputs system;
        inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
      };
      modules = [
        ./system
        inputs.disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = {
            inherit inputs outputs system;
            inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
          };
          home-manager.users."dann".imports = [
            ./home
          ];
        }
      ];
    };
  };
}
