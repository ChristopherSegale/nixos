{ nixosSystem, system, home-manager, drawterm}:

let
configs = { inherit home-manager; };
in { 
  G752 = import ./mkhost {
    inherit nixosSystem configs drawterm;
    host = {
      inherit system;
      hardware = "G752";
      boot = "efi";
      type = "baremetal";
      graphics = {
        gpu = "nvidia";
        wm = "plasma.nix";
      };
      audio = true;
      printing = true;
    }; 
    user = "csegale";
  };
  home-desktop = import ./mkhost {
    inherit nixosSystem configs drawterm;
    host = {
      inherit system;
      hardware = "home-desktop";
      boot = "efi";
      type = "baremetal";
      graphics = {
        gpu = "amd";
        wm = "plasma.nix";
      };
      audio = true;
      printing = true;
    };
    user = "csegale";
  };
  legion-pro-7i = import ./mkhost {
    inherit nixosSystem configs drawterm;
    host = {
      inherit system;
      hardware = "legion-pro-7i";
      boot = "efi";
      type = "baremetal";
      graphics = {
        gpu = "nvidia";
        wm = "plasma.nix";
      };
      audio = true;
      printing = true;
    };
    user = "csegale";
  };
  new-hardware = import ./mkhost {
    inherit nixosSystem configs drawterm;
    host = {
      inherit system;
      hardware = "new-hardware";
      boot = "efi";
      type = "baremetal";
      graphics = {
        gpu = "amd";
        wm = "plasma.nix";
      };
      audio = true;
      printing = true;
    };
    user = "csegale";
  };
  QubesOS = import ./mkhost {
    inherit nixosSystem configs drawterm;
    host = {
      inherit system;
      hardware = "QubesOS";
      boot = "mbr";
      type = "QubesOS";
      graphics = {
        gpu = null;
        wm = "plasma.nix";
      };
      audio = true;
      printing = true;
    };
    user = "user";
  };
}
