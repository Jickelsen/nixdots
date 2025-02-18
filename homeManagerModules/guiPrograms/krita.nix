{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.krita;
in
{
  options.guiprograms.krita.enable = lib.mkEnableOption "krita";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      krita
    ];

  };
}
