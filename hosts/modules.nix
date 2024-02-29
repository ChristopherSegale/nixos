{ host, home-manager }:

{ "G752" = [
    ./hardware/G752
    ./hardware/boot/efi.nix
    ../defaults
    ./user/baremetal
    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { user = "csegale"; };
      home-manager.users.csegale = {
        imports = [(import ./user/baremetal/home.nix)];
      };
    }
    ../graphics/nvidia.nix
    ../desktop/plasma.nix
    ../desktop/pipeware.nix
    ../desktop/printing.nix
  ];
}."${host}"
