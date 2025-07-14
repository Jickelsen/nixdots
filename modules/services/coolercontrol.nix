{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.coolercontrol;
in
{

  options.services.coolercontrol.enable = lib.mkEnableOption "Coolercontrol GUI and service";

  config = lib.mkIf cfg.enable {
    programs.coolercontrol.enable = true;
    environment.systemPackages = with pkgs; [
      lm_sensors
    ];
  };
}
