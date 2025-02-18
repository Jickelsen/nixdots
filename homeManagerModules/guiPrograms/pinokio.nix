{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.pinokio;
in
{
  options.guiprograms.pinokio.enable = lib.mkEnableOption "pinokio";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      conda
      pinokio
    ];

  };
}
