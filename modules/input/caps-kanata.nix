{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.input.caps;
in
{
  options.input.caps.enable = lib.mkEnableOption "Useful caps lock and other rebinds";
  
  config = lib.mkIf cfg.enable {
    hardware.uinput.enable = true;
    
    services.udev.extraRules = ''
      KERNEL=="uinput", RUN+="${pkgs.acl}/bin/setfacl -m g:uinput:rw /dev/uinput"
      # Restart kanata when keyboards are added (for KVM switches)
      ACTION=="add", SUBSYSTEM=="input", KERNEL=="event*", ATTRS{name}=="*Keyboard*", TAG+="systemd", RUN+="${pkgs.systemd}/bin/systemctl try-restart kanata-caps.service"
    '';

    users.users.kanata = {
      isSystemUser = true;
      group = "kanata";
      extraGroups = [ "input" "uinput" ];
    };
    users.groups.kanata = { };

    systemd.services.kanata-caps.serviceConfig = {
      DynamicUser = lib.mkForce false;
      PrivateUsers = lib.mkForce false;
      User = "kanata";
      Group = "kanata";
      # Auto-restart for robustness
      Restart = "on-failure";
      RestartSec = "2s";
    };
    
    services.kanata = {
      enable = true;
      keyboards = {
        "caps" = {
          port = 6666;
          config = ''
            (defsrc
              caps
              lmet lalt 
            )
            (defvar
              tap-time 200
              hold-time 200
            )
            (defalias
              cap (tap-hold-press $tap-time $hold-time esc (multi lctl lsft lalt lmet))
            )
            (deflayer base
              @cap
              lalt lmet
            )
          '';
        };
      };
    };
  };
}