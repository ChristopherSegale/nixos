{ nixpkgs, home-manager, snake }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs { inherit system; };
  inherit (nixpkgs.lib) nixosSystem;
in
#builtins.mapAttrs
#  (name: value: lib.nixosSystem {
#    inherit system;
#    modules = import ./modules.nix { host = "${name}"; inherit home-manager snake; }; }
#  ) {
#      G752 = null;
#      QubesOS = null;
#}
import ./modules.nix {
  inherit nixosSystem system home-manager snake;
}

