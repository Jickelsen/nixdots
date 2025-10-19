{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.cliprograms.vrc-get;
in
{
  options.cliprograms.vrc-get.enable = lib.mkEnableOption "VRC-Get VRChat Dev tool";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vrc-get
    ];

  };
}
