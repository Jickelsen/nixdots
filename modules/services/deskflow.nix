{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.deskflow;
in
{

  options.services.deskflow.enable = lib.mkEnableOption "Deskflow";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      deskflow
    ];
  };
}
