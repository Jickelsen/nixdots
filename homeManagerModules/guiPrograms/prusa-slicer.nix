{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.prusa-slicer;
in
{
  options.guiprograms.prusa-slicer.enable = lib.mkEnableOption "Prusaslicer";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      prusa-slicer
    ];

  };
}
