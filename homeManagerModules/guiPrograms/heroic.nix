{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.heroic;
in
{
  options.guiprograms.heroic.enable = lib.mkEnableOption "Heroic";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      heroic
    ];

  };
}
