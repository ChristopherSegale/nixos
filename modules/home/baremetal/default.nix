{ config, pkgs, user, drawterm, ... }:

{
  imports = [
    ../../desktop/programs/web-browsers.nix
    ../../desktop/programs/virtualization.nix
    ../../desktop/programs/containers.nix
    ../../desktop/programs/productivity.nix
    ../../desktop/programs/development-tools.nix
    ../../desktop/programs/multimedia.nix
    ../../desktop/programs/misc.nix
    ../../desktop/programs/console-games.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";

    packages = [ pkgs.dosbox-x drawterm ];
  };

  programs = {
    home-manager.enable = true;

    inherit (import ../configs.nix pkgs) git emacs;
  };
}
