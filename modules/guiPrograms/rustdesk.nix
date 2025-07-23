{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.rustdesk;
in
{
  options.guiprograms.rustdesk.enable = lib.mkEnableOption "RustDesk GUI Program";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      rustdesk-flutter
    ];
  };
}
