{ nixosSystem, host, user, configs }:

let
inherit (host) system hardware boot type graphics audio printing;
inherit (graphics) gpu wm;
inherit (configs) home-manager emacs-config;
in nixosSystem {
  inherit system;
  modules = [
    ../hardware/${hardware}
    (if (host.boot == "efi")
     then ../hardware/boot/efi.nix
     else
       ../hardware/boot/mbr.nix)
    ../../defaults
    ../user/${type}
    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit user emacs-config; };
      home-manager.users.${user} = {
        imports = [(import ../user/${type}/home.nix)];
      };
    }
    (if (gpu == "nvidia")
     then ../../graphics/nvidia.nix
     else
      if (gpu == "amd")
      then ../../graphics/amd.nix
      else null)
    ../../desktop/${wm}
    (if (audio) then ../../desktop/pipewire.nix else null)
    (if (printing) then ../../desktop/printing.nix else null)
  ];
}
