{ config,inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    age.keyFile = "/home/jickel/.config/sops/age/keys.txt";
    defaultSopsFile = ../secrets/secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "syncthing/password" = { owner = "jickel"; };
      "syncthing/nixos-id" = { owner = "jickel"; };
      "syncthing/JickMBP16-id" = { owner = "jickel"; };
      "syncthing/Synology-DS918-id" = { owner = "jickel"; };
      "syncthing/Jickelphone-id" = { owner = "jickel"; };
    };
  };
}