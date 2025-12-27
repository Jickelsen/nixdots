{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.protonup;
in
{
  options.guiprograms.protonup.enable = lib.mkEnableOption "Protonup utility for ProtonGE";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      protonup-ng
      protonup-qt
    ];
    home.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

  };
}
