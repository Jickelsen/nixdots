{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.bottles;
in
{
  options.guiprograms.bottles.enable = lib.mkEnableOption "Bottles";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bottles
    ];

  };
}
