{ lib, pkgs, config, ... }:

let
  inherit (lib) mkEnableOption mkOption mkIf;
  cfg = config.my-hosts.user;
in {
  options.my-hosts.user = {
    enable = mkEnableOption "Defining user for host";
    user = mkOption {
      type = lib.types.str;
      default = "user";
    };
    fullName = mkOption {
      type = lib.types.str;
      default = "Qubes OS";
    };
  };

  config = mkIf cfg.enable {
    users.users.${cfg.user} = {
      isNormalUser = true;
      description = cfg.fullName;
      initialPassword = "mySecretPass"; # Remember to change password after initial installation
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
