{ nixpkgs, home-manager }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs { inherit system; };
  lib = nixpkgs.lib;
in
builtins.mapAttrs
  (name: value: lib.nixosSystem {
    inherit system; modules = import ./modules.nix { host = "${name}"; inherit home-manager; }; }
  ) {
      G752 = null;
      QubesOS = null;
}

