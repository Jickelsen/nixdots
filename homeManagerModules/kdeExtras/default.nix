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
    ./plasmaConfig
  ];


  options.kdeextras.enable = lib.mkEnableOption "KDE Desktop Environment";

  config = lib.mkIf cfg.enable {
    kdeextras.krohnkite.enable = lib.mkDefault true;
    kdeextras.kdeconnect.enable = lib.mkDefault true;
    kdeextras.plasmaConfig.enable = lib.mkDefault false;
    home.packages = with pkgs; [
      # inputs.klassy-nix.packages."${pkgs.system}".default
      audacious
      # inputs.nur.legacyPackages."${pkgs.system}".repos.shadowrz.klassy-qt6
      #qmmp
      haruna
      kdePackages.krdp
      # Use latest master for KWin 6.6 compatibility (fixes QRegion -> KWin::Region)
      (kde-rounded-corners.overrideAttrs (oldAttrs: {
        version = "unstable-2026-02-01";
        src = pkgs.fetchFromGitHub {
          owner = "matinlotfali";
          repo = "KDE-Rounded-Corners";
          rev = "32e7386c0dfc66fa0c6a606977aa84c96f8300d3";
          hash = "sha256-5KjYk2lApVKeR09c2XRywLqzU5wcea7B73GSYHN9djA=";
        };
      }))
      (kdePackages.kdenlive.override { ffmpeg-full = ffmpeg_7-full; })
      kdiskmark
    ];
  };
}