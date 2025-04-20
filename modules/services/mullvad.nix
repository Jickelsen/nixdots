{
  config,
  lib,
  pkgs,
  ...
}:

# From https://www.youtube.com/watch?v=GH3kpsbbERo
# converted using o1

let
  cfg = config.services.mullvad;
in
{

  options.services.mullvad.enable = lib.mkEnableOption "Mullvad VPN";

  config = lib.mkIf cfg.enable {
    services.mullvad-vpn.enable = true;
    services.mullvad-vpn.package = pkgs.mullvad-vpn;
  };
}
