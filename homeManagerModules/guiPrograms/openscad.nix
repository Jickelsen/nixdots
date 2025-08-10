{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.openscad;
in
{
  options.guiprograms.openscad.enable = lib.mkEnableOption "Openscad";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      openscad
    ];

  };
}
