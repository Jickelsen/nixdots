{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.programs.discord;
in
{
  options.programs.discord.enable = lib.mkEnableOption "Discord";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      discord
    ];

  };
}
