{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.ghostty;
in
{
  options.guiprograms.ghostty.enable = lib.mkEnableOption "Ghostty";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      inputs.ghostty.packages."${pkgs.system}".default
    ];

  };
}
