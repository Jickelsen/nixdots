{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.kdeextras.krohnkite;
in
{
  options.kdeextras.krohnkite.enable = lib.mkEnableOption "Krohnkite Tiling Window Manager for KDE";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kdePackages.krohnkite
    ];
  };
}
