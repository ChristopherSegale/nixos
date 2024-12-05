{ config, pkgs, ... }:

{
  imports = [ ./legion-pro-7i ];

  networking.hostName = "legion-pro-7i";
}
