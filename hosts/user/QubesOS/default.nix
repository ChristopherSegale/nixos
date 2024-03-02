{ config, pkgs, ... }:

{
  # Declare mountpoint for configuration
  fileSystems."/etc/nixos" = {
    device = "/home/user/nixos";
    options = [ "bind" ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "Qubes OS";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
