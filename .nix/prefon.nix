{ writeScriptBin
, bash
, coreutils
, imagemagick
, ...
}:

writeScriptBin "prefon" (builtins.replaceStrings
  [
    "#!/bin/sh"
    "printf"
    "convert"
    "rm"
  ]
  [
    "#!${bash}/bin/sh"
    "${coreutils}/bin/printf"
    "${imagemagick}/bin/convert"
    "${coreutils}/bin/rm"
  ]
  (builtins.readFile ../scritps/prefon)
)
