{
  description = "Flake for managing the configuration of various hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-config = {
      url = "github:ChristopherSegale/emacs-config";
      flake = false;
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, emacs-config }: {
    nixosConfigurations = (
      import ./hosts { inherit nixpkgs home-manager emacs-config; }
    );
  };
}
