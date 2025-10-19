{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.services.alvr;
in
{
  options.services.alvr.enable = lib.mkEnableOption "ALVR";

  config = lib.mkIf cfg.enable {
     nixpkgs.overlays = [
      (final: prev: {
        alvr = prev.alvr.overrideAttrs (old: {
          buildInputs = (old.buildInputs or []) ++ [ prev.gmp prev.nettle ];
        });
      })
    ];

    programs.alvr.enable = true;
    programs.alvr.openFirewall = true;
  };
}
