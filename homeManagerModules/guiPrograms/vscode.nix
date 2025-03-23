{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.guiprograms.vscode;
in
{
  options.guiprograms.vscode.enable = lib.mkEnableOption "VSCode";

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;

      profiles.default.extensions = with pkgs.vscode-extensions; [
        # UX
        vscodevim.vim
        vspacecode.vspacecode
        vspacecode.whichkey

        # Look n feel
        # jdinhlife.gruvbox
        catppuccin.catppuccin-vsc

        # Languages
        bbenoist.nix
        brettm12345.nixfmt-vscode
        foxundermoon.shell-format
      ];
    };

  };
}
