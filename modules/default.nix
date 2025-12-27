{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./cliPrograms/vrc-get.nix
    ./guiPrograms/gparted.nix
    ./guiPrograms/rustdesk.nix
    ./guiPrograms/unityhub.nix
    ./guiPrograms/wireguard.nix
    ./input/swerty.nix
    ./styling/catppuccin.nix
    ./styling/stylix.nix
    ./sops.nix
    ./services/alvr.nix
    ./services/coolercontrol.nix
    ./services/devbox.nix
    ./services/distrobox.nix
    ./services/docker.nix
    ./services/monado-vr.nix
    ./services/mullvad.nix
    ./services/ollama.nix
    ./services/rustdesk-server.nix
    ./services/syncthing.nix
    ./services/tailscale.nix
    ./services/virt.nix
    ./services/yubikey.nix
  ];

  cliprograms.vrc-get.enable = lib.mkDefault true;
  guiprograms.gparted.enable = lib.mkDefault true;
  guiprograms.rustdesk.enable = lib.mkDefault true;
  guiprograms.unityhub.enable = lib.mkDefault true;
  guiprograms.wireguard.enable = lib.mkDefault true;
  input.swerty.enable = lib.mkDefault true;
  themes.catppuccin.enable = lib.mkDefault false;
  styling.stylix.enable = lib.mkDefault true;
  services.alvr.enable = lib.mkDefault true;
  services.coolercontrol.enable = lib.mkDefault true;
  services.devbox.enable = lib.mkDefault true;
  services.distrobox.enable = lib.mkDefault true;
  services.docker.enable = lib.mkDefault true;
  services.monado-vr.enable = lib.mkDefault false;
  services.mullvad.enable = lib.mkDefault true;
  services.ollama-webui.enable = lib.mkDefault false;
  services.rustdesk-server-service.enable = lib.mkDefault false;
  services.syncthing-client.enable = lib.mkDefault true;
  services.tailscale-vpn.enable = lib.mkDefault true;
  services.virt.enable = lib.mkDefault true;
  services.yubikey.enable = lib.mkDefault true;

}
