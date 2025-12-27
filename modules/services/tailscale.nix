{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.tailscale-vpn;
in
{

  options.services.tailscale-vpn.enable = lib.mkEnableOption "Tailscale VPN";

  config = lib.mkIf cfg.enable {
    services.tailscale.enable = true;
    # services.tailscale.port = 12345;
    # networking.firewall.allowedUDPPorts = [ ${services.tailscale.port} ];
    environment.systemPackages = with pkgs; [ tailscale ];
  };


}
