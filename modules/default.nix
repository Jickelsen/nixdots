{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    #./input/keyboard.nix
    ./input/swerty.nix
    ./catppuccin.nix
    ./services/syncthing.nix
  ];

  # keyboard.enable = lib.mkDefault true;
  input.swerty.enable = lib.mkDefault true;
  themes.catppuccin.enable = lib.mkDefault true;
  services.syncthing-client.enable = lib.mkDefault true;

}
