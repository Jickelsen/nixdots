{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.noson;
in
{
  options.guiprograms.noson.enable = lib.mkEnableOption "noson";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      noson
    ];

  };
}
