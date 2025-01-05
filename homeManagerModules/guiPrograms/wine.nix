{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.wine;
in
{
  options.guiprograms.wine.enable = lib.mkEnableOption "Wine";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # winetricks (all versions)
      winetricks

      # native wayland support (unstable)
      wineWowPackages.waylandFull
    ];

  };
}
