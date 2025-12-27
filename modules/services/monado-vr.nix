{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.monado-vr;
in
{

  options.services.monado-vr.enable = lib.mkEnableOption "Monado VR";

  config = lib.mkIf cfg.enable {
    services.monado = {
      enable = true;
      defaultRuntime = true; # Register as default OpenXR runtime
    };
    systemd.user.services.monado.environment = {
      STEAMVR_LH_ENABLE = "1";
      XRT_COMPOSITOR_COMPUTE = "1";
    };
  };
}
