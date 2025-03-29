{ config, pkgs, ... }:

{
  imports = [ ./legion-pro-7i.nix ];

  networking.hostName = "legion-pro-7i";
  networking.networkmanager.wifi.powersave = false;
}
