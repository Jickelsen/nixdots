{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.orca-slicer;
in
{
  options.guiprograms.orca-slicer.enable = lib.mkEnableOption "Orca Slicer";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      orca-slicer
    ];

  };
}
