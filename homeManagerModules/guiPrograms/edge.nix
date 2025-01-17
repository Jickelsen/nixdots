{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.edge;
in
{
  options.guiprograms.edge.enable = lib.mkEnableOption "Microsoft Edge";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      microsoft-edge
    ];

  };
}
