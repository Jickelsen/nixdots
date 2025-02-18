{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.alvr;
in
{
  options.guiprograms.alvr.enable = lib.mkEnableOption "ALVR";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      alvr
    ];
  };
}
