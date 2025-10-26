{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.cliprograms.nixcats-nvim;
in
{
  imports = [
    inputs.nixcats-nvim.homeModule
  ];
  options.cliprograms.nixcats-nvim.enable = lib.mkEnableOption "Neovim configured through NixCats";

  config = lib.mkIf cfg.enable {
    nvim.enable = true;
  };
}
