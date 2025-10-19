{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.unityhub;
in
{
  options.guiprograms.unityhub.enable = lib.mkEnableOption "UnityHub";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      unityhub
    ];

  };
}
