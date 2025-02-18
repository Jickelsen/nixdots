{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.arduino;
in
{
  options.guiprograms.arduino.enable = lib.mkEnableOption "Arduino IDE";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      arduino-ide
    ];

  };
}
