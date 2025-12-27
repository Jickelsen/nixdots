{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.devbox;
in
{

  options.services.devbox.enable = lib.mkEnableOption "Devbox";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      devbox
    ];
  };
}
