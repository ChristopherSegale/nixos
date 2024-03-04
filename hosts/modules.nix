{ host, home-manager, snake }:

{ 
  "G752" = [
    ./hardware/G752
    ./hardware/boot/efi.nix
    ../defaults
    ./user/baremetal
    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { user = "csegale"; inherit snake; };
      home-manager.users.csegale = {
        imports = [(import ./user/baremetal/home.nix)];
      };
    }
    ../graphics/nvidia.nix
    ../desktop/plasma.nix
    ../desktop/pipewire.nix
    ../desktop/printing.nix
  ];
  "QubesOS" = [
    ./hardware/QubesOS
    ./hardware/boot/mbr.nix
    ../defaults
    ./user/QubesOS
    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { user = "user"; };
      home-manager.users.user = {
        imports = [(import ./user/QubesOS/home.nix)];
      };
    }
    ../desktop/plasma.nix
    ../desktop/pipewire.nix
    ../desktop/printing.nix
  ];
}."${host}"
