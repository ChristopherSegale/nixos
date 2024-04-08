{ nixosSystem, system, home-manager, snake }:

{ 
  G752 = nixosSystem {
    inherit system;
    modules = [
      ./hardware/G752
      ./hardware/boot/efi.nix
      ../defaults
      ./user/baremetal
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { user = "csegale"; inherit emacs-config; };
        home-manager.users.csegale = {
          imports = [(import ./user/baremetal/home.nix)];
        };
      }
      ../graphics/nvidia.nix
      ../desktop/plasma-old.nix
      ../desktop/pipewire.nix
      ../desktop/printing.nix
    ];
  };
  new-hardware = nixosSystem {
    inherit system;
    modules = [
      ./hardware/new-hardware
      ./hardware/boot/efi.nix
      ../defaults
      ./user/baremetal
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { user = "csegale"; inherit emacs-config; };
        home-manager.users.csegale = {
          imports = [(import ./user/baremetal/home.nix)];
        };
      }
      ../graphics/amd.nix
      ../desktop/plasma-old.nix
      ../desktop/pipewire.nix
      ../desktop/printing.nix
    ];
  };
  QubesOS = nixosSystem {
    inherit system;
    modules = [
      ./hardware/QubesOS
      ./hardware/boot/mbr.nix
      ../defaults
      ./user/QubesOS
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { user = "user"; inherit emacs-config; };
        home-manager.users.user = {
          imports = [(import ./user/QubesOS/home.nix)];
        };
      }
      ../desktop/plasma-old.nix
      ../desktop/pipewire.nix
      ../desktop/printing.nix
    ];
  };
}
