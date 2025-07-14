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
        # vscodevim.vim
        # vspacecode.vspacecode
        # Installing above manually as vspacecode includes a bunch of other plugins, which won't get installed if we define here

        # Look n feel
        # jdinhlife.gruvbox
        catppuccin.catppuccin-vsc

        # Languages
        jnoortheen.nix-ide
        foxundermoon.shell-format
      ];
    };

  };
}
