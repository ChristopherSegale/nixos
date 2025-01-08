{
  description = "Flake for managing the configuration of various hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    drawterm = "github:ChristopherSegale/drawterm-flake";
  };

  outputs = inputs @ { self, nixpkgs, home-manager drawterm }: {
    nixosConfigurations = (
      import ./hosts { inherit nixpkgs home-manager; drawterm; }
    );
  };
}
