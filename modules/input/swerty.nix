{
  lib,
  pkgs,
  config,
  ...
}:

# Adapted rom this amazing post by u/_MrOrange
# https://www.reddit.com/r/sweden/comments/1fs2oe2/knacka_kod_p%C3%A5_svenska_tangenbord_suger_ibland_men/

let
  cfg = config.input.swerty;
  newKanata = pkgs.kanata.overrideAttrs (old: {
    mkService.DeviceAllow = [
      "/dev/uinput rw"
      "char-input rw"
    ];
  });
in
{
  options.input.swerty.enable = lib.mkEnableOption "Swerty";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
     kanata
    ];
    services.kanata = {
      package = newKanata;
      enable = true;
      keyboards = {
        "swerty".config = ''
          ;;(deflocalkeys-linux
          ;;  å   26
          ;;  ö   39
          ;;  ä   40
          ;;)
          (deftemplate text-paste (text)
            (macro
              (clipboard-save 0)
              20
              (clipboard-set $text)
              100
              C-v
              (clipboard-restore 0)
            )
          )
          (defsrc
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft < z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rmet rctl
          )

          (deflayer default
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    @aa    ]    \
            @cap a    s    d    f    g    h    j    k    l    @oo    @aaa     ret
            @lsft @lsft z    x    c    v    b    n    m    ,    .    /    @rsft
            lctl lmet lalt           spc            @ralt rmet rctl
          )

          (deflayer swedishUpper
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    @AA    ]    \
            @cap a    s    d    f    g    h    j    k    l    @OO    @AAA     ret
            lsft lsft z    x    c    v    b    n    m    ,    .    /    @rsft
            lctl lmet lalt           spc            @ralt rmet rctl
          )

          (deflayer americanSymbols
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            @cap a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            @ralt rmet rctl
          )

          (defalias
            ;; make caps-lock useful: tap for escape, hold for left ctrl
            cap (tap-hold-press 200 200 esc (multi lctl lsft lalt lmet))

            ;; in swedish layer: write swedish capital letters with left shift
            lsft (multi lsft (layer-toggle swedishUpper))

            ;; in swedish layer: toggle back to american for symbols with right alt
            ralt (tap-hold 200 200 ralt (layer-toggle americanSymbols))

            ;; in swedish layer: toggle back to american symbols + shift with right shift (: for vim save etc)
            rsft (multi rsft (layer-toggle americanSymbols))

            aa (t! text-paste "T")
            aaa (t! text-paste "ä")
            oo (t! text-paste "ö")
            AA (t! text-paste "Å")
            AAA (t! text-paste "Ä")
            OO (t! text-paste "Ö")
          )
        '';
      };
    };
  };
}
