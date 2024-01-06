{ writeScriptBin
, bash
, coreutils
, gnused
, ...
}:

writeScriptBin "thm" (builtins.replaceStrings
  [
    "#!/bin/sh"
    "printf"
    "mkdir"
    "mv"
    "sed"
  ]
  [
    "#!${bash}/bin/sh"
    "${coreutils}/bin/printf"
    "${coreutils}/bin/mkdir"
    "${coreutils}/bin/mv"
    "${gnused}/bin/sed"
  ]
  (builtins.readFile ../scritps/thm)
)
