{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.cursor;
in
{
  options.guiprograms.cursor.enable = lib.mkEnableOption "Cursor IDE";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      code-cursor
    ];

  };
}
