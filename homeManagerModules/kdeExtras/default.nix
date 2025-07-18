{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:

let
  cfg = config.kdeextras;

in
{
  imports = [
    ./krohnkite.nix
    ./kdeconnect.nix
  ];


  options.kdeextras.enable = lib.mkEnableOption "KDE Desktop Environment";

  config = lib.mkIf cfg.enable {
    kdeextras.krohnkite.enable = lib.mkDefault true;
    kdeextras.kdeconnect.enable = lib.mkDefault false;
    home.packages = with pkgs; [
      # inputs.klassy-nix.packages."${pkgs.system}".default
      audacious
      inputs.nur.legacyPackages."${pkgs.system}".repos.shadowrz.klassy-qt6
      #qmmp
      kdePackages.krdp
    ];
  };
}
