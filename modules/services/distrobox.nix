{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.distrobox;
in
{

  options.services.distrobox.enable = lib.mkEnableOption "Distrobox";

  config = lib.mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
    };
    environment.systemPackages = [ pkgs.distrobox pkgs.distroshelf ];
    environment.etc."distrobox/distrobox.conf".text = ''
      container_additional_volumes="/nix/store:/nix/store:ro /etc/profiles/per-user:/etc/profiles/per-user:ro"
    '';
  };
}
