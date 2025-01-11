{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    htop
    neofetch
    neovim
    nh
    nixfmt-rfc-style
    nixpkgs-fmt
    sshpass
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];
}
