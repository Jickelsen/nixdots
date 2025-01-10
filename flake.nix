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
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.2";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    catppuccin.url = "github:catppuccin/nix";
    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nixpkgs-master, home-manager, nix-flatpak, zen-browser, catppuccin, ghostty }:
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
          ./modules
          {
            config.environment.systemPackages = [
              nixpkgs-master.legacyPackages.x86_64-linux.pipewire
            ];
          }
        ];
      };
    };
}
