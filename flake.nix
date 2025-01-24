{
  description = "Flake for managing the configuration of various hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    drawterm.url = "github:ChristopherSegale/drawterm-flake";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, drawterm }: {
    nixosConfigurations = (
      import ./hosts { inherit nixpkgs home-manager drawterm; }
    );
  };
}
