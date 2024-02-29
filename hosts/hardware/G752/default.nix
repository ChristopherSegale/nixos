{ config, pkgs, ... }:

{
  imports = [ ./G752.nix ];

  networking.hostName = "G752";
}
