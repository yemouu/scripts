{ writeScriptBin
, bash
, coreutils
, grim
, imagemagick
, libnotify
, slurp
, wl-clipboard
, xdg-utils
, ...
}:

writeScriptBin "colorgrab" (builtins.replaceStrings
  [
    "#!/bin/sh"
    "mkdir"
    "printf"
    "grim"
    "slurp"
    "convert"
    "wl-copy"
    "xdg-open"
    "notify-send"
  ]
  [
    "#!${bash}/bin/sh"
    "${coreutils}/bin/mkdir"
    "${coreutils}/bin/printf"
    "${grim}/bin/grim"
    "${slurp}/bin/slurp"
    "${imagemagick}/bin/convert"
    "${wl-clipboard}/bin/wl-copy"
    "${xdg-utils}/bin/xdg-open"
    "${libnotify}/bin/notify-send"
  ]
  (builtins.readFile ../scritps/colorgrab)
)
