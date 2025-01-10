{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.sublime-merge;
in
{
  options.guiprograms.sublime-merge.enable = lib.mkEnableOption "Sublime Merge";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      sublime-merge
    ];

  };
}
