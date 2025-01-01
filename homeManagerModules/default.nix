{ pkgs, lib, ... }:

{
  imports = [
    ./cliPrograms/tmux.nix
    ./guiPrograms/zen.nix
    ./guiPrograms/discord.nix
  ];

  programs.tmuxConfig.enable = lib.mkDefault true;
  programs.zen.enable = lib.mkDefault true;
  programs.discord.enable = lib.mkDefault true;

}
