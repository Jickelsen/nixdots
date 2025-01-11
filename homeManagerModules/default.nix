{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./catppuccin.nix
    ./cliPrograms
    ./cliPrograms/tmux.nix
    ./flatPaks
    ./guiPrograms/bottles.nix
    ./guiPrograms/discord.nix
    ./guiPrograms/ghostty.nix
    ./guiPrograms/heroic.nix
    ./guiPrograms/lutris.nix
    ./guiPrograms/obsidian.nix
    ./guiPrograms/protonup.nix
    ./guiPrograms/sublime-merge.nix
    ./guiPrograms/teams.nix
    ./guiPrograms/telegram.nix
    ./guiPrograms/vscode.nix
    ./guiPrograms/wine.nix
    ./guiPrograms/zen.nix
  ];

  themes.catppuccin.enable = lib.mkDefault true;

  cliprograms.tmux.enable = lib.mkDefault true;

  flatpaks.common.enable = lib.mkDefault true;

  guiprograms.bottles.enable = lib.mkDefault true;
  guiprograms.discord.enable = lib.mkDefault true;
  guiprograms.ghostty.enable = lib.mkDefault true;
  guiprograms.heroic.enable = lib.mkDefault true;
  guiprograms.lutris.enable = lib.mkDefault true;
  guiprograms.obsidian.enable = lib.mkDefault true;
  guiprograms.sublime-merge.enable = lib.mkDefault true;
  guiprograms.protonup.enable = lib.mkDefault true;
  guiprograms.teams.enable = lib.mkDefault true;
  guiprograms.telegram.enable = lib.mkDefault true;
  guiprograms.vscode.enable = lib.mkDefault true;
  guiprograms.wine.enable = lib.mkDefault true;
  guiprograms.zen.enable = lib.mkDefault true;

}
