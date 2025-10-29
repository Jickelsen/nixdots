{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:


let
  cfg = config.services.syncthing-client;
in
{
  #imports = [
  #  inputs.sops-nix.nixosModules.sops
  #];
  options.services.syncthing-client.enable = lib.mkEnableOption "Syncthing";

  config = lib.mkIf cfg.enable {
    systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true"; # Don't create default ~/Sync folder
    # system.userActivationScripts.addSyncthingDevices = {
    #   text = let 
    #     hostnames = ["nixos" "JickMBP16" "Synology-DS918" "Jickelphone"];
    #     hostnamesFormatted = lib.concatStringsSep " " (map (hostname: ''${config.sops.secrets."syncthing/${hostname}-id".path}'') hostnames);
    #     hostnamesArray = lib.concatStringsSep " " (map (hostname: ''"${hostname}"'') hostnames);
    #     syncthing = lib.getExe pkgs.syncthing;
    #   in ''
    #     #!/bin/bash
    #     declare -a id_paths=(${hostnamesFormatted})
    #     declare -a device_names=(${hostnamesArray})
    #     for i in "''${!id_paths[@]}" 
    #     do
    #       device_id=$(cat "''${id_paths[$i]}")
    #       device_name="''${device_names[$i]}"
    #       ${syncthing} cli config devices add --device-id "$device_id" --name "$device_name" --auto-accept-folders
    #    done
    #   '';
    # };
    services.syncthing = {
      enable = true;
      user = "jickel";
      configDir = "/home/jickel/.config/syncthing";
      # settings = {
      #   gui = {
      #     user = "jickel";
      #     # Awaiting PR for this
      #     # passwordFile = config.sops.secrets."syncthing/password".path;
      #   };
      #   devices = {
      #     "nixos" = { id=""; };
      #     "JickMBP16" = { id="";};
      #     "Synology-DS918" = {id ="";};
      #     "Jickelphone" = {id="";};
      #   };
      #   folders = {
      #     "documents" = {
      #       path = "/home/jickel/Documents";
      #       label = "Documents";
      #       devices = [ "nixos" "JickMBP16" "Synology-DS918" "Jickelphone" ];
      #       # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
      #       # ignorePerms = false;
      #     };
      #     "music" = {
      #       path = "/home/jickel/Music";
      #       label = "Music";
      #       devices = [ "nixos" "JickMBP16" "Synology-DS918" "Jickelphone" ];
      #       # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
      #       # ignorePerms = false;
      #     };
      #     # "Obsidian-Jickel" = {
      #     #   path = "/home/jickel/Obsidian/Jickel";
      #     #   label = "Obsidian-Jickel";
      #     #   devices = [ "nixos" "JickMBP16" "Synology-DS918" "Jickelphone" ];
      #     #   # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
      #     #   # ignorePerms = false;
      #     # };
      #   };
      # };
    };
  };
}
