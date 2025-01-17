{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.gparted;
in
{
  options.guiprograms.gparted.enable = lib.mkEnableOption "GParted";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gparted
    ];

  };
}
