{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      forAllSystems = function: nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ]
        (system: function (import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        }));
    in
    {
      overlays.default = final: prev: rec {
        colorgrab = final.callPackage ./.nix/colorgrab.nix { };
        prefon = final.callPackage ./.nix/prefon.nix { };
        scr = final.callPackage ./.nix/scr.nix { };
        thm = final.callPackage ./.nix/thm.nix { };
        yemou-scripts = final.symlinkJoin {
          name = "yemou-scripts";
          paths = [ colorgrab prefon scr thm ];
        };
      };

      packages = forAllSystems (pkgs: {
        colorgrab = pkgs.colorgrab;
        default = pkgs.yemou-scripts;
        prefon = pkgs.prefon;
        scr = pkgs.scr;
        thm = pkgs.thm;
        yemou-scripts = pkgs.yemou-scripts;
      });
    };
}
