{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.mailspring;
in
{
  options.guiprograms.mailspring.enable = lib.mkEnableOption "Mailspring";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mailspring
    ];

  };
}
