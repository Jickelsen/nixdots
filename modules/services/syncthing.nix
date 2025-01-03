{
  config,
  lib,
  pkgs,
  ...
}:

# From https://www.youtube.com/watch?v=GH3kpsbbERo
# converted using o1

let
  cfg = config.services.syncthing-client;
in
{
  options.services.syncthing-client.enable = lib.mkEnableOption "Syncthing";

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      dataDir = "/home/jickel/Synctest";
      enable = true;
      user = "jickel";
    };
  };
}
