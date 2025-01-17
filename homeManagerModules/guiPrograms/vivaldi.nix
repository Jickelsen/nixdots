{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.vivaldi;
in
{
  options.guiprograms.vivaldi.enable = lib.mkEnableOption "Vivaldi Web Browser";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (vivaldi.overrideAttrs
      (oldAttrs: {
        dontWrapQtApps = false;
        dontPatchELF = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
        }))
    ];
  };
}
