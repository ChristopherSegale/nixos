{ lib, pkgs, config, ... }:

let
  inherit (lib) mkEnableOption mkOption mkIf;
  cfg = config.mounting.nixos;
in {
  options.mounting.nixos = {
    enable = mkEnableOption "Mounting local nixos directory to root";
    user = mkOption {
      type = lib.types.str;
      default = "user";
    };
  };

  config = mkIf cfg.enable {
    fileSystems = {
      "/etc/nixos" = {
        depends = [
	  "/etc"
	  "/home"
	];
        device = "/home/${cfg.user}/nixos";
        fsType = "none";
        options = [ "bind" ];
      };
    };
  };
}
