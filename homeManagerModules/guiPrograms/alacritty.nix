{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.alacritty;
in
{
  options.guiprograms.alacritty.enable = lib.mkEnableOption "Alacritty";

  config = lib.mkIf cfg.enable {
    programs.alacritty.enable = true;

  };
}
