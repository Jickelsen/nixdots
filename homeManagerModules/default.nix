{ pkgs, lib, inputs, ... }:

{
  imports = [
    ./guiPrograms/discord.nix
    ./guiPrograms/ghostty.nix
    ./guiPrograms/obsidian.nix
    ./guiPrograms/teams.nix
    ./cliPrograms
    ./cliPrograms/tmux.nix
    ./guiPrograms/vscode.nix
    ./guiPrograms/wine.nix
    ./guiPrograms/zen.nix
    ./catppuccin.nix
  ];

  programs.discord.enable = lib.mkDefault true;
  guiprograms.ghostty.enable = lib.mkDefault true;
  guiprograms.obsidian.enable = lib.mkDefault true;
  guiprograms.teams.enable = lib.mkDefault true;
  programs.tmuxConfig.enable = lib.mkDefault true;
  guiprograms.vscode.enable = lib.mkDefault true;
  guiprograms.wine.enable = lib.mkDefault true;
  programs.zen.enable = lib.mkDefault true;
  themes.catppuccin.enable = lib.mkDefault true;

}
