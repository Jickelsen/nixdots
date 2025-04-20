{ inputs, config, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "/home/jickel/.config/sops/age/keys.txt";
    defaultSopsFile = ../secrets/secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "hello" = {};
    };
  };
}