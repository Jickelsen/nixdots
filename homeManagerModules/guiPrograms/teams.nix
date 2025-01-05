{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.teams;
in
{
  options.guiprograms.teams.enable = lib.mkEnableOption "Teams for Linux";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      teams-for-linux
    ];

  };
}
