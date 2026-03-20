# Swerty keyboard layout module for NixOS
# https://johanegustafsson.net/projects/swerty/
#
# Usage in your configuration.nix or flake:
#
#   imports = [ ./swerty.nix ];
#   
#   swerty.enable = true;
#
# Then set your keyboard layout to "swerty" (it's a standalone layout, not a variant)
# 
# For X11 (services.xserver):
#   services.xserver.xkb.layout = "swerty";
#
# For Hyprland:
#   wayland.windowManager.hyprland.settings.input.kb_layout = "swerty";
#
# For Sway:
#   wayland.windowManager.sway.config.input."*" = {
#     xkb_layout = "swerty";
#   };
#
# For KDE Plasma, it should appear as "Swerty" in System Settings → Keyboard → Layouts

{ config, lib, pkgs, ... }:

let
  cfg = config.input.swerty-layout;
  
  # Swerty needs to be a complete layout, not a partial.
  # It's based on US layout but with Swedish characters on [;' keys
  # and Swedish-style AltGr mappings.
  swertySymbols = ''
    // Swerty by Johan E. Gustafsson
    // https://johanegustafsson.net/projects/swerty/
    // Modified for NixOS as standalone layout
    
    default partial alphanumeric_keys
    xkb_symbols "basic" {

        include "us(basic)"

        name[Group1]="Swerty";

        key <TLDE>  { [     grave,  asciitilde, section, onehalf ]   };
        key <AE01>  { [         1,     exclam                    ]   };
        key <AE02>  { [         2,         at,  quotedbl         ]   };
        key <AE03>  { [         3, numbersign,  sterling         ]   };
        key <AE04>  { [         4,     dollar,  currency         ]   };
        key <AE05>  { [         5,    percent,  EuroSign         ]   };
        key <AE06>  { [         6, asciicircum, dead_circumflex  ]   };
        key <AE07>  { [         7,  ampersand,  braceleft        ]   };
        key <AE08>  { [         8,   asterisk,  bracketleft      ]   };
        key <AE09>  { [         9,  parenleft,  bracketright     ]   };
        key <AE10>  { [         0, parenright,  braceright       ]   };
        key <AE11>  { [     minus, underscore,  dead_diaeresis,  dead_circumflex ]  };
        key <AE12>  { [     equal,       plus,  dead_tilde       ]   };

        key <AD03>  { [         e,          E,  EuroSign         ]   };
        key <AD09>  { [         o,          O,  braceleft        ]   };
        key <AD10>  { [         p,          P,  braceright       ]   };
        key <AD11>  { [     aring,      Aring,  bracketleft,  braceleft  ]   };
        key <AD12>  { [dead_acute, dead_grave,  bracketright, braceright ]   };

        key <AC10>  { [ odiaeresis, Odiaeresis, semicolon, colon ]   };
        key <AC11>  { [ adiaeresis, Adiaeresis, apostrophe, quotedbl ]  };

        key <BKSL>  { [ backslash,        bar                    ]   };
        key <AB07>  { [         m,          M,  mu               ]   };
        key <AB09>  { [    period,    greater,  colon            ]   };
        
        include "level3(ralt_switch)"
    };
  '';

in {
  options.input.swerty-layout = {
    enable = lib.mkEnableOption "Swerty keyboard layout";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.xkb.extraLayouts.swerty = {
      description = "Swerty";
      languages = [ "swe" ];
      symbolsFile = pkgs.writeText "swerty-symbols" swertySymbols;
    };
  };
}
