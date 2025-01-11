{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };

    description = lib.mkOption {
      default = "mainuser description";
      description = ''
        description of user
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "12345";
      description = cfg.description;
      extraGroups = [
        "networkmanager"
        "wheel"
        "uinput"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        #  thunderbird
      ];
    };
  };
}
