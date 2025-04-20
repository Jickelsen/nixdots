{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.themes.catppuccin;
in
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];
  options.themes.catppuccin.enable = lib.mkEnableOption "catppuccin";

  config = lib.mkIf cfg.enable {
    catppuccin.flavor = "mocha";
    # catppuccin.enable = true;

  };
}
