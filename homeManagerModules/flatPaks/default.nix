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
    services.flatpak.remotes = lib.mkOptionDefault [
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];

    services.flatpak.update.auto.enable = false;
    services.flatpak.uninstallUnmanaged = true;
    services.flatpak.packages = [
      { appId = "org.gimp.GIMP"; origin = "flathub-beta"; }
      #"com.obsproject.Studio"
      #"im.riot.Riot"
      "org.kde.kasts"
      "org.kde.partitionmanager"
    ];
  };
}
