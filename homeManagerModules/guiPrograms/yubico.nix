{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.yubico;
in
{
  options.guiprograms.yubico.enable = lib.mkEnableOption "Yubico Authenticator";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      yubioath-flutter
    ];

  };
}
