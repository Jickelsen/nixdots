{
  config,
  lib,
  pkgs,
  ...
}:

# From https://nixos.wiki/wiki/Virt-manager

let
  cfg = config.services.virt;
in
{

  options.services.virt.enable = lib.mkEnableOption "Virt-Manager";

  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;

    virtualisation.libvirtd.enable = true;

    virtualisation.spiceUSBRedirection.enable = true;

  };
}
