{ writeScriptBin
, bash
, coreutils
, ffmpeg
, grim
, pulseaudio
, slurp
, wf-recorder
, wl-clipboard
, ...
}:

writeScriptBin "scr" (builtins.replaceStrings
  [
    "#!/bin/sh"
    "printf"
    "mkdir"
    "ffmpeg"
    "grim"
    "slurp"
    "wl-copy"
    "pactl"
    "wf-recorder"
  ]
  [
    "#!${bash}/bin/sh"
    "${coreutils}/bin/printf"
    "${coreutils}/bin/mkdir"
    "${ffmpeg}/bin/ffmpeg"
    "${grim}/bin/grim"
    "${slurp}/bin/slurp"
    "${wl-clipboard}/bin/wl-copy"
    "${pulseaudio}/bin/pactl"
    "${wf-recorder}/bin/wf-recorder"
  ]
  (builtins.readFile ../scritps/scr)
)
