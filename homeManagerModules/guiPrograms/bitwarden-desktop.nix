{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.bitwarden-desktop;
in
{
  options.guiprograms.bitwarden-desktop.enable = lib.mkEnableOption "Bitwarden Desktop";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];

  };
}
