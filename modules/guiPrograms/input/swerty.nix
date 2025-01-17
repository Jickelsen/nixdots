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
in
{
  options.input.swerty.enable = lib.mkEnableOption "Swerty";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kanata
    ];
    services.kanata = {
      enable = true;
      keyboards = {
        "swerty".config = ''
          ;;(deflocalkeys-linux
          ;;  å   26
          ;;  ö   39
          ;;  ä   40
          ;;)
          (defsrc
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft < z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rmet rctl
          )

          (deflayer default
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    (unicode å)    ]    \
            @cap a    s    d    f    g    h    j    k    l    (unicode ö)    (unicode ä)     ret
            @lsft @lsft z    x    c    v    b    n    m    ,    .    /    @rsft
            lctl lmet lalt           spc            @ralt rmet rctl
          )

          (deflayer swedishUpper
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    (unicode Å)    ]    \
            @cap a    s    d    f    g    h    j    k    l    (unicode Ö)    (unicode Ä)     ret
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
          )
        '';
      };
    };
  };
}
