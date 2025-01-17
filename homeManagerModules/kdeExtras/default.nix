{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:

let
  cfg = config.kdeextras;
  # klassyQt6 = pkgs.callPackage ./klassy/package.nix { qtMajorVersion = "6"; };
  # klassyQt6 = pkgs.callPackage ./klassy/package.nix;

in
{
  imports = [
    ./krohnkite.nix
    ./kdeconnect.nix
  ];


  options.kdeextras.enable = lib.mkEnableOption "KDE Desktop Environment";

  config = lib.mkIf cfg.enable {
    kdeextras.krohnkite.enable = lib.mkDefault true;
    kdeextras.kdeconnect.enable = lib.mkDefault true;
    # environment.systemPackages = with pkgs; [
    #   (pkgs.callPackage ./klassy/package.nix { qtMajorVersion = "6"; })
    # ];
    home.packages = with pkgs; [
    #   (pkgs.callPackage ./klassy/package.nix { qtMajorVersion = "6"; })
    #   # klassyQt6
      inputs.klassy-nix.packages."${pkgs.system}".default
    ];
  };
}
