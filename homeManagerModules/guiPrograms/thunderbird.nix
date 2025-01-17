{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.thunderbird;
in
{
  options.guiprograms.thunderbird.enable = lib.mkEnableOption "Mozilla Thunderbird";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      thunderbird
    ];

  };
}
