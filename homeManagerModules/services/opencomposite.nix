{ config, lib, pkgs, ... }:

let
  cfg = config.services.opencomposite;
in
{
  options.services.opencomposite.enable = lib.mkEnableOption "OpenComposite Settings";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      opencomposite
    ];
    # For Monado:
    xdg.configFile."openxr/1/active_runtime.json".source =
      "${pkgs.monado}/share/openxr/1/openxr_monado.json";

    xdg.configFile."openvr/openvrpaths.vrpath".text = ''
      {
        "config" :
        [
          "${config.xdg.dataHome}/Steam/config"
        ],
        "external_drivers" : null,
        "jsonid" : "vrpathreg",
        "log" :
        [
          "${config.xdg.dataHome}/Steam/logs"
        ],
        "runtime" :
        [
          "${pkgs.opencomposite}/lib/opencomposite"
        ],
        "version" : 1
      }
    '';
  };
}
