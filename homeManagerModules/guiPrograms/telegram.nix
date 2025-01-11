{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.telegram;
in
{
  options.guiprograms.telegram.enable = lib.mkEnableOption "Telegram Desktop";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      telegram-desktop
    ];

  };
}
