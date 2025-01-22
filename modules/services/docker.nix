{
  config,
  lib,
  pkgs,
  ...
}:

# From https://www.youtube.com/watch?v=GH3kpsbbERo
# converted using o1

let
  cfg = config.services.docker;
in
{

  options.services.docker.enable = lib.mkEnableOption "Docker";

  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;
  };
}
