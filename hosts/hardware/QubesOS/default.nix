{ config, pkgs, ... }:

{
  imports = [ ./QubesOS.nix ];

  networking.hostName = "QubesOS";
}
