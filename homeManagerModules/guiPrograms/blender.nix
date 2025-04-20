{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.blender;
in
{
  options.guiprograms.blender.enable = lib.mkEnableOption "Blender";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      blender
    ];

  };
}
