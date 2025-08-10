{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.cliprograms.zellij;
in
{
  options.cliprograms.zellij.enable = lib.mkEnableOption "Zellij terminal multiplexer";

  config = lib.mkIf cfg.enable {
    programs.zellij.enable = true;
  };
}
