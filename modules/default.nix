{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./guiPrograms/gparted.nix
    ./guiPrograms/wireguard.nix
    #./input/keyboard.nix
    ./input/swerty.nix
    ./catppuccin.nix
    ./sops.nix
    ./services/coolercontrol.nix
    ./services/devbox.nix
    ./services/docker.nix
    ./services/mullvad.nix
    ./services/ollama.nix
    ./services/syncthing.nix
    ./services/tailscale.nix
    ./services/virt.nix
    ./services/yubikey.nix
  ];

  # keyboard.enable = lib.mkDefault true;
  guiprograms.gparted.enable = lib.mkDefault true;
  guiprograms.wireguard.enable = lib.mkDefault true;
  input.swerty.enable = lib.mkDefault true;
  themes.catppuccin.enable = lib.mkDefault true;
  services.coolercontrol.enable = lib.mkDefault true;
  services.devbox.enable = lib.mkDefault true;
  services.docker.enable = lib.mkDefault true;
  services.mullvad.enable = lib.mkDefault true;
  services.ollama-webui.enable = lib.mkDefault false;
  services.syncthing-client.enable = lib.mkDefault true;
  services.tailscale-vpn.enable = lib.mkDefault true;
  services.virt.enable = lib.mkDefault true;
  services.yubikey.enable = lib.mkDefault true;

}
