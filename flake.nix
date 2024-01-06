{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
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

    packages."x86_64-linux" =
      let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [ self.overlays.default ];
        };
      in
      {
        colorgrab = pkgs.colorgrab;
        default = pkgs.yemou-scripts;
        prefon = pkgs.prefon;
        scr = pkgs.scr;
        thm = pkgs.thm;
        yemou-scripts = pkgs.yemou-scripts;
      };
  };
}
