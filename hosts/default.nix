{ nixpkgs, home-manager, drawterm }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs { inherit system; };
  inherit (nixpkgs.lib) nixosSystem;
in
import ./modules.nix {
  inherit nixosSystem system home-manager drawterm;
}

