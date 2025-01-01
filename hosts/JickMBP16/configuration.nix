{ inputs, pkgs, config, ... }:

{
  imports =
    [
      ../common-packages.nix
    ];

  services.nix-daemon.enable = true;
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  # system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
  # system.configurationRevision = with inputs; mkIf (self ? rev) self.rev;

  # Used for backwards compatibility. please read the changelog
  # before changing: `darwin-rebuild changelog`.
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  # If you're on an Intel system, replace with "x86_64-darwin"
  nixpkgs.hostPlatform = "x86_64-darwin";

  # Declare the user that will be running `nix-darwin`.
  users.users.jickel = {
    name = "jickel";
    home = "/Users/jickel";
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    mkalias
  ];

  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';
  system.defaults = {
    dock.autohide = true;
    dock.persistent-apps = [
      "/System/Applications/System Settings.app"
      "/Applications/Zen Browser.app"
      "/Applications/Microsoft Teams.app"
      "${pkgs.alacritty}/Applications/Alacritty.app"
      "/Applications/Obsidian.app"
    ];
    finder.FXPreferredViewStyle = "clmv";
    NSGlobalDomain.KeyRepeat = 2;
  };
}
