{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.services.yubikey;
in
{
  options.services.yubikey.enable = lib.mkEnableOption "Yubikey support";


  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      yubioath-flutter
    ];
    services.udev.packages = [ pkgs.yubikey-personalization ];
    services.pcscd.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

  };
}
