{ config, pkgs, ... }:

let
  user = "csegale";
in
{
  # Declare mountpoint for configuration
  fileSystems."/etc/nixos" = {
    device = "/home/${user}/nixos";
    options = [ "bind" ];
  };

   # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "Christopher Charles Segale";
    initialPassword = "mySecretPass"; # Remember to change password after initial installation
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
