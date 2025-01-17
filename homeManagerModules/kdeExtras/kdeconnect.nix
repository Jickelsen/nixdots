{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.kdeextras.kdeconnect;
in
{
  options.kdeextras.kdeconnect.enable = lib.mkEnableOption "KDE Connect";

  config = lib.mkIf cfg.enable {
    services.kdeconnect.enable = true;

  };
}
