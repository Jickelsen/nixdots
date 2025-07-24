{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    curl
    htop
    kubectl
    libnotify
    neofetch
    neovim
    nh
    nixfmt-rfc-style
    nixpkgs-fmt
    sops
    sshpass
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    wl-clipboard
    wtype
  ];

  programs.ydotool.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
}
