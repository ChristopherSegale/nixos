{
  description = "Flake for managing the configuration of various hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snake.url = "github:ChristopherSegale/cl-snake";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, snake }: {
    nixosConfigurations = (
      import ./hosts { inherit nixpkgs home-manager snake; }
    );
  };
}
