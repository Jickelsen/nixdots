{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.discord;
in
{
  options.guiprograms.discord.enable = lib.mkEnableOption "Discord";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      discord
    ];

  };
}
