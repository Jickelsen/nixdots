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
    services.flatpak.update.auto.enable = false;
    services.flatpak.uninstallUnmanaged = true;
    services.flatpak.packages = [
      "org.gimp.GIMP"
      "org.kde.kasts"
      "org.kde.partitionmanager"
      "com.rustdesk.RustDesk"
      "dev.bragefuglseth.Keypunch"
    ];
  };
}
