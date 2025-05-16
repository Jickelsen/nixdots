{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.proton-suite;
in
{
  options.guiprograms.proton-suite.enable = lib.mkEnableOption "Proton software suite";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      proton-pass
      protonvpn-gui
      protonvpn-cli 
      protonmail-desktop
      protonmail-bridge-gui
      
    ];

  };
}
