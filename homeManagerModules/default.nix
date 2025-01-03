{ pkgs, lib, ... }:

{
  imports = [
    ./guiPrograms/discord.nix
    ./guiPrograms/obsidian.nix
    ./cliPrograms/tmux.nix
    ./guiPrograms/vscode.nix
    ./guiPrograms/zen.nix
    ./catppuccin.nix
  ];

  programs.discord.enable = lib.mkDefault true;
  guiprograms.obsidian.enable = lib.mkDefault true;
  programs.tmuxConfig.enable = lib.mkDefault true;
  guiprograms.vscode.enable = lib.mkDefault true;
  programs.zen.enable = lib.mkDefault true;
  themes.catppuccin.enable = lib.mkDefault true;

}
