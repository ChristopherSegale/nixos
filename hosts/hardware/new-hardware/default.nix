{ pkgs, config, ... }:

let
  user = "csegale";
  fullName = "Christopher Charles Segale";
in {
  imports = [
    ../../../modules/boot/efi.nix
    ../../../modules/defaults.nix
    ../../../modules/graphics/amd.nix
    ../../../modules/desktop/pipewire.nix
    ../../../modules/desktop/plasma.nix
    ../../../modules/desktop/printing.nix
    ../../../modules/containers.nix
    ../../../modules/home/user.nix
    ../../../modules/home/mount-config.nix
  ];

  my-hosts.user = {
    enable = true;
    inherit user fullName;
  };    

  mounting.nixos = {
    enable = false;
  };
}
