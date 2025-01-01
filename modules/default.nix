{ pkgs, lib, ... }:

{
  imports = [
    #./input/keyboard.nix
    ./input/swerty.nix
  ];

  # keyboard.enable = lib.mkDefault true;
  input.swerty.enable = lib.mkDefault true;

}