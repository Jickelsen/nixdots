{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.signal-desktop;
in
{
  options.guiprograms.signal-desktop.enable = lib.mkEnableOption "Signal GUI application";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      signal-desktop-bin
    ];

  };
}
