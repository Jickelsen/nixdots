{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.zen;
in
{
  options.guiprograms.zen.enable = lib.mkEnableOption "zen browser";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      inputs.zen-browser.packages."${system}".default
    ];
    #inputs.home-manager.home.packages = with pkgs; [zen-browser.packages."${system}".default ];
    #inputs.zen-browser.url = "github:0xc000022070/zen-browser-flake";

  };
}
