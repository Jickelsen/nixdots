{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../homeManagerModules
  ];

  nixpkgs.config.allowUnfree = true;
  home.username = "jickel";
  home.homeDirectory = "/home/jickel";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
