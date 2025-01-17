{
  lib,
  config,
  pkgs,
  ...
}:

# // TODO: Switch to Kanata and make Swerty available
# https://discourse.nixos.org/t/best-way-to-remap-caps-lock-to-esc-with-wayland/39707
# https://nixos.wiki/wiki/Keyboard_Layout_Customization

{
  options.keyboard = {
    enable = lib.mkEnableOption "enable keyboard module";

    capsEsc = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Rebind caps lock to esc
      '';
    };
  };

  config = lib.mkIf config.keyboard.enable {
    # Remap CAPS lock to ESC
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(capslock_layer, esc)";
            };
          };
          extraConfig = ''
            # put here any extra-config, e.g. you can copy/paste here directly a configuration, just remove the ids part

            [capslock_layer:C-S-A-M]
            h = left
            j = down
            k = up
            l = right
          '';
        };
      };
    };
  };
}
