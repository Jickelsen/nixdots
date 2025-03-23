# ~/.config/nix/flake.nix

{
  description = "Jickels system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.2";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    catppuccin.url = "github:catppuccin/nix";
    ghostty.url = "github:ghostty-org/ghostty";
    klassy-nix = {
      url = "github:dshatz/klassy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nixpkgs-master,
      home-manager,
      nur,
      nix-flatpak,
      zen-browser,
      catppuccin,
      ghostty,
      klassy-nix,
      plasma-manager,
    }:
    let
    in
    {
      darwinConfigurations."JickMBP16" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/JickMBP16/configuration.nix
          ./hosts/JickMBP16/homebrewPackages.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.jickel = ./hosts/JickMBP16/home.nix;
          }
        ];
      };
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos/configuration.nix
          home-manager.nixosModules.default
          nur.modules.nixos.default
          ./modules
        ];
      };
      nixosConfigurations."x230" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/x230/configuration.nix
          home-manager.nixosModules.default
          nur.modules.nixos.default
          ./modules
        ];
      };
    };
}
