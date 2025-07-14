{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.flatpaks.common;
in
{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];
  options.flatpaks.common.enable = lib.mkEnableOption "FlatPaks";

  config = lib.mkIf cfg.enable {
    services.flatpak.update.auto.enable = true;
    services.flatpak.uninstallUnmanaged = true;
    services.flatpak.packages = [
      "org.gimp.GIMP"
      "org.kde.kasts"
      "dev.bragefuglseth.Keypunch"
      "org.kartkrew.RingRacers"
    ];
  };
}
