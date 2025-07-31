inputs:

let
  system = "x86_64-linux";
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (inputs) home-manager drawterm;
in builtins.mapAttrs (name: value:
  nixosSystem {
    inherit system;
    modules = [
      ./hardware/${name}
      ./hardware/${name}/hardware.nix
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { 
          inherit (value) user;
          drawterm = drawterm.packages.${system}.default;
        };
        home-manager.users.${value.user} = {
          imports = [(import ../modules/home/${value.hardware})];
        };
      }
    ];
  }) {
       G752 = { hardware = "baremetal"; user = "csegale"; };
       home-desktop = { hardware = "baremetal"; user = "csegale"; };
       legion-pro-7i = { hardware = "baremetal"; user = "csegale"; };
       new-hardware = { hardware = "baremetal"; user = "csegale"; };
}
