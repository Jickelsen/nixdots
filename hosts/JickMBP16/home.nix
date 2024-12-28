{ pkgs, ... }:
{
  # this is internal compatibility configuration 
  # for home-manager, don't change this!
  home.stateVersion = "23.05";
  # Let home-manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [ ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  #home.file.".SpaceVim.d/init.toml".source = ./spacevim/init.toml;
  # programs.vim = {
  #   enable = true;
  #   defaultEditor = true;
  #   plugins = with pkgs.vimPlugins; [
  #     space-vim
  #   ];
  # Use the Nix package search engine to find
  # even more plugins : https://search.nixos.org/packages
  # };
}
