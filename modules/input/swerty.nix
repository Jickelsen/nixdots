{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.input.swerty;
in
{
  options.input.swerty.enable = lib.mkEnableOption "Swerty";

  config = lib.mkIf cfg.enable {
    console.keyMap = "sv-latin1"; 
    hardware.uinput.enable = true;
  # Set up `udev` rules for `uinput`
    boot.kernelModules = [ "uinput" ];
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';
 
  users.groups.uinput = { }; # Ensure `uinput` group exists
  systemd.services.kanata-swerty.serviceConfig = {
    SupplementaryGroups = [ "input" "uinput" ];
  }; # Add kanata service user to necessary groups


  services.kanata = {
    enable = true;
    keyboards = {
      "swerty".config = ''
;; Swerty (ANSI, Swedish OS layout)

;; ANSI US physical layout
(defsrc
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  caps a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft
  lctl lmet lalt                spc                ralt rmet rctl
)

;; ---------- Aliases ----------
;; RAlt US on Å/Ä/Ö:
(defalias us_lbr     RA-8)      ;; [
(defalias us_lbrace  (multi (release-key lsft) RA-7))      ;; {
(defalias us_semi    S-,)       ;; ;
(defalias us_colon   S-.)       ;; :
(defalias us_apos    \)         ;; '
(defalias us_dquote  S-2)       ;; "

;; US number-row on plain Shift (complete):
(defalias us_tilde    (multi (release-key lsft) RA-]))    ;; ~
(defalias us_excl     S-1)      ;; !
(defalias us_at       (multi (release-key lsft) RA-2))     ;; @
(defalias us_hash     S-3)      ;; #
(defalias us_dollar   (multi (release-key lsft) RA-4))     ;; $
(defalias us_percent  S-5)      ;; %
(defalias us_caret    S-])      ;; ^
(defalias us_amp      S-6)      ;; &
(defalias us_asterisk S-\)      ;; *
(defalias us_lpar     S-8)      ;; (
(defalias us_rpar     S-9)      ;; )
(defalias us_underscore (multi (release-key lsft) S-/))    ;; _
(defalias us_plus     (multi (release-key lsft) -))      ;; +

;; US punctuation with Shift:
(defalias us_pipe    (multi (release-key lsft) RA-lsgt))   ;; |
(defalias us_lt      (multi (release-key lsft) lsgt))      ;; <
(defalias us_gt      S-lsgt)    ;; >
(defalias us_qmark   S--)       ;; ?
(defalias us_rbrace  (multi (release-key lsft) RA-0))      ;; }

;; Base-layer overrides (no modifier):
(defalias us_grave     S-=)      ;; `   
(defalias us_dash        /)      ;; -   
(defalias us_equals    S-0)      ;; =   
(defalias us_rbr     RA-9)       ;; ]
(defalias us_bslash     RA--)    ;; \
(defalias us_slash   S-7)        ;; /

;; make caps-lock useful: tap for escape, hold for hyper (all modifiers)
(defalias cap (tap-hold-press 200 200 esc (multi lctl lsft lalt lmet)))
;; ---------- Layers ----------

;; Base: pass-through + overrides;
(deflayer base
  @us_grave  1    2    3    4    5    6    7    8    9    0    @us_dash    @us_equals    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [   @us_rbr  @us_bslash
  @cap a    s    d    f    g    h    j    k    l    ;    '    ret
  (multi lsft (layer-while-held usShift)) z  x    c    v    b    n    m    ,    .   @us_slash  (multi lsft (layer-while-held usShift))
  lctl (multi lmet (layer-while-held usSuper)) lalt                spc         (layer-while-held us)        rmet rctl
)

;; ANSI US layout when holding lmeta/super for hyprland shortcuts etc
(deflayer usSuper
  @us_grave  1    2    3    4    5    6    7    8    9    0    @us_dash    @us_equals    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    @us_rbr    @us_bslash
  @cap a    s    d    f    g    h    j    k    l    ;    '    ret
  (multi lsft (layer-while-held usShift)) z    x    c    v    b    n    m    ,    .    @us_slash    (multi lsft (layer-while-held usShift))
  lctl lmet lalt                spc                ralt rmet rctl
)

;; RAlt: US on Å/Ä/Ö
(deflayer us
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    @us_lbr @us_rbr    \
  @cap a    s    d    f    g    h    j    k    l    @us_semi  @us_apos  ret
  (layer-while-held usS) z  x    c    v    b    n    m    ,    .    /   (layer-while-held usS)
  lctl lmet lalt                spc                ralt rmet rctl
)

;; RAlt+Shift: US shifted on Å/Ä/Ö
(deflayer usS
  grv  1     2     3     4     5     6     7     8     9     0     -     =     bspc
  tab  q     w     e     r     t     y     u     i     o     p     @us_lbrace @us_rbrace     \
  @cap a     s     d     f     g     h     j     k     l     @us_colon  @us_dquote  ret
  lsft z     x     c     v     b     n     m     ,     .     /     rsft
  lctl lmet lalt                 spc                 ralt  rmet  rctl
)

;; Shift (no RAlt): FULL US number row + < > ? } etc and uppercase
(deflayer usShiftBAK
  @us_tilde  @us_excl  @us_at  @us_hash  @us_dollar  @us_percent  @us_caret  @us_amp  @us_asterisk  @us_lpar  @us_rpar  @us_underscore  @us_plus  bspc
  tab  S-q       S-w     S-e       S-r         S-t          S-y        S-u      S-i           S-o       S-p       S-[               ]           @us_pipe
  @cap S-a       S-s     S-d       S-f         S-g          S-h        S-j      S-k           S-l       S-;         S-'           ret
  lsft S-z       S-x     S-c       S-v         S-b          S-n        S-m      @us_lt        @us_gt    @us_qmark     rsft
  lctl lmet lalt                            spc                              (layer-while-held usS) rmet rctl
)

;; Shift (no RAlt): FULL US number row + < > ? } etc and uppercase
(deflayer usShift
  @us_tilde  @us_excl  @us_at  3  @us_dollar  5  @us_caret  @us_amp  @us_asterisk  @us_lpar  @us_rpar  @us_underscore  @us_plus  bspc
  tab  q       w     e       r         t          y        u      i           o       p       [               @us_rbrace            @us_pipe
  @cap a       s     d       f         g          h        j      k           l       ;         '           ret
  lsft z       x     c       v         b          n        m      @us_lt        @us_gt    @us_qmark     rsft
  lctl (multi lmet (layer-while-held usSuper)) lalt                            spc                              (layer-while-held usS) rmet rctl
)
        '';
      };
    };
  };
}
