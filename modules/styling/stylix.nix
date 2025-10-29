{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.styling.stylix;
in
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  options.styling.stylix.enable = lib.mkEnableOption "Stylix theming framework";

  config = lib.mkIf cfg.enable {
    stylix.enable = true;
    stylix.image = ../../homeManagerModules/styles/current-wallpaper.jpg;
  };
}
