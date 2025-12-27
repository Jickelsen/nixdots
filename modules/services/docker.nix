{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.docker;
in
{

  options.services.docker.enable = lib.mkEnableOption "Docker";

  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;
  };
}
