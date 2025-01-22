{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./guiPrograms/gparted.nix
    #./input/keyboard.nix
    ./input/swerty.nix
    ./catppuccin.nix
    ./services/syncthing.nix
    ./services/docker.nix
  ];

  # keyboard.enable = lib.mkDefault true;
  guiprograms.gparted.enable = lib.mkDefault true;
  input.swerty.enable = lib.mkDefault true;
  themes.catppuccin.enable = lib.mkDefault true;
  services.syncthing-client.enable = lib.mkDefault true;
  services.docker.enable = lib.mkDefault true;

}
