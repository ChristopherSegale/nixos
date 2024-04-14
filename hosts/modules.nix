{ nixosSystem, system, home-manager, emacs-config }:

let
configs = { inherit home-manager emacs-config; };
in { 
  G752 = import ./mkhost {
    inherit nixosSystem configs;
    host = {
      inherit system;
      hardware = "G752";
      boot = "efi";
      type = "baremetal";
      graphics = {
        gpu = "nvidia";
        wm = "plasma-old.nix";
      };
      audio = true;
      printing = true;
    }; 
    user = "csegale";
  };
  new-hardware = import ./mkhost {
    inherit nixosSystem configs;
    host = {
      inherit system;
      hardware = "new-hardware";
      boot = "efi";
      type = "baremetal";
      graphics = {
        gpu = "amd";
        wm = "plasma-old.nix";
      };
      audio = true;
      printing = true;
    };
    user = "csegale";
  };
  QubesOS = import ./mkhost {
    inherit nixosSystem configs;
    host = {
      inherit system;
      hardware = "QubesOS";
      boot = "mbr";
      type = "QubesOS";
      graphics = {
        gpu = null;
        wm = "plasma-old.nix";
      };
      audio = true;
      printing = true;
    };
    user = "user";
  };
}
