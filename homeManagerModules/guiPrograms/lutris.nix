{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.lutris;
in
{
  options.guiprograms.lutris.enable = lib.mkEnableOption "Lutris";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      lutris
    ];

  };
}
