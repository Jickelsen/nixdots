{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.godot;
in
{
  options.guiprograms.godot.enable = lib.mkEnableOption "Godot Mono";

  config = lib.mkIf cfg.enable {
    nixpkgs.config.permittedInsecurePackages = [
      "dotnet-sdk-6.0.428"
    ];
    home.packages = with pkgs; [
      godot_4-mono
    ];

  };
}
