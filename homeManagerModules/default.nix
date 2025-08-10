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
    ./cliPrograms/zellij.nix
    ./flatPaks
    ./guiPrograms/alvr.nix
    ./guiPrograms/arduino.nix
    ./guiPrograms/bitwarden-desktop.nix
    ./guiPrograms/blender.nix
    ./guiPrograms/bottles.nix
    ./guiPrograms/discord.nix
    ./guiPrograms/edge.nix
    ./guiPrograms/ghostty.nix
    ./guiPrograms/godot.nix
    ./guiPrograms/heroic.nix
    ./guiPrograms/krita.nix
    ./guiPrograms/lutris.nix
    ./guiPrograms/mailspring.nix
    ./guiPrograms/noson.nix
    ./guiPrograms/obsidian.nix
    ./guiPrograms/openscad.nix
    ./guiPrograms/orca-slicer.nix
    ./guiPrograms/gsf-tools.nix
    ./guiPrograms/pinokio.nix
    ./guiPrograms/proton-suite.nix
    ./guiPrograms/protonup.nix
    ./guiPrograms/prusa-slicer.nix
    ./guiPrograms/signal-desktop.nix
    ./guiPrograms/sublime-merge.nix
    ./guiPrograms/teams.nix
    ./guiPrograms/telegram.nix
    ./guiPrograms/thunderbird.nix
    ./guiPrograms/vivaldi.nix
    ./guiPrograms/vscode.nix
    ./guiPrograms/wine.nix
    ./guiPrograms/zen.nix
    ./services/opencomposite.nix 
    ./kdeExtras
    #./plasmaConfig
    ./sops.nix
  ];

  themes.catppuccin.enable = lib.mkDefault true;

  cliprograms.tmux.enable = lib.mkDefault false;
  cliprograms.zellij.enable = lib.mkDefault true;

  flatpaks.common.enable = lib.mkDefault true;

  guiprograms.alvr.enable = lib.mkDefault false;
  guiprograms.arduino.enable = lib.mkDefault true;
  guiprograms.bitwarden-desktop.enable = lib.mkDefault true;
  guiprograms.blender.enable = lib.mkDefault true;
  guiprograms.bottles.enable = lib.mkDefault true;
  guiprograms.discord.enable = lib.mkDefault true;
  guiprograms.edge.enable = lib.mkDefault true;
  guiprograms.ghostty.enable = lib.mkDefault true;
  guiprograms.godot.enable = lib.mkDefault true;
  guiprograms.heroic.enable = lib.mkDefault true;
  guiprograms.krita.enable = lib.mkDefault true;
  guiprograms.lutris.enable = lib.mkDefault true;
  guiprograms.mailspring.enable = lib.mkDefault true;
  guiprograms.noson.enable = lib.mkDefault true;
  guiprograms.obsidian.enable = lib.mkDefault true;
  guiprograms.openscad.enable = lib.mkDefault true;
  guiprograms.orca-slicer.enable = lib.mkDefault true;
  guiprograms.prusa-slicer.enable = lib.mkDefault true;
  guiprograms.signal-desktop.enable = lib.mkDefault true;
  guiprograms.sublime-merge.enable = lib.mkDefault true;
  guiprograms.gsf-tools.enable = lib.mkDefault true;
  guiprograms.pinokio.enable = lib.mkDefault true;
  guiprograms.proton-suite.enable = lib.mkDefault true;
  guiprograms.protonup.enable = lib.mkDefault true;
  guiprograms.teams.enable = lib.mkDefault true;
  guiprograms.telegram.enable = lib.mkDefault true;
  guiprograms.thunderbird.enable = lib.mkDefault true;
  guiprograms.vivaldi.enable = lib.mkDefault true;
  guiprograms.vscode.enable = lib.mkDefault true;
  guiprograms.wine.enable = lib.mkDefault true;
  guiprograms.zen.enable = lib.mkDefault true;
  services.opencomposite.enable = lib.mkDefault false;
  kdeextras.enable = lib.mkDefault true;
}
