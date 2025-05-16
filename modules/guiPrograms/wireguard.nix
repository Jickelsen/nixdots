{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.wireguard;
in
{
  options.guiprograms.wireguard.enable = lib.mkEnableOption "Wireguard UI";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wireguard-ui
    ];

  };
}
