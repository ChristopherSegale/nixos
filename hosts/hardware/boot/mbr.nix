{ config, pkgs, ... }:

{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/xvda";
  boot.loader.grub.useOSProber = true;
}
