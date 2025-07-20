{
  description = "Flake for managing the configuration of various hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    drawterm = {
      url = "github:ChristopherSegale/drawterm-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, drawterm }: {
    nixosConfigurations = (
      import ./hosts { inherit nixpkgs home-manager drawterm; }
    );
  };
}
