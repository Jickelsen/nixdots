{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    #zsh
    awscli
    p7zip
    bat
    fzf
    ranger
    starship
    tree
    unzip
  ];

  # Default shell setup
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = ../dotfiles/zshrc/.zshrc;
    # ".config/wezterm".source = ~/dotfiles/wezterm;
    # ".config/skhd".source = ~/dotfiles/skhd;
    ".config/starship/starship.toml".source = ../dotfiles/starship/starship.toml;
    # ".config/nvim".source = ~/dotfiles/nvim;
    # ".config/nix".source = ~/dotfiles/nix;
    # ".config/nix-darwin".source = ~/dotfiles/nix-darwin;
    # ".config/tmux".source = ~/dotfiles/tmux;
    # ".config/ghostty".source = ~/dotfiles/ghostty;
  };

}
