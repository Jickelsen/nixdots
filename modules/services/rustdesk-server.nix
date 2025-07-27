{
  config,
  lib,
  pkgs,
  ...
}:

# From https://www.youtube.com/watch?v=GH3kpsbbERo
# converted using o1

let
  cfg = config.services.rustdesk-server-service;
in
{

  options.services.rustdesk-server-service.enable = lib.mkEnableOption "Rustdesk Remote Desktop Server";

  config = lib.mkIf cfg.enable {
    services = {
      rustdesk-server = {
        enable = true;
        openFirewall = true;
      };
    };
  };
}
