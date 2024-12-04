{ config, pkgs, ... }:

{
  imports = [ ./new-hardware.nix ];

  networking.hostName = "new-hardware";
}
