{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.qbittorrent;
in
{
  options.guiprograms.qbittorrent.enable = lib.mkEnableOption "qBittorrent";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      qbittorrent
    ];
  };
}
