{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.gsf-tools;
in
{
  options.guiprograms.gsf-tools.enable = lib.mkEnableOption "GSF Tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mumble
      pidgin
    ];

  };
}
