{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.obsidian;
in
{
  options.guiprograms.obsidian.enable = lib.mkEnableOption "Obsidian";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
    ];

  };
}
