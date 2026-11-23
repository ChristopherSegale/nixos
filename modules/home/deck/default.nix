{ config, pkgs, ... }:

{
  imports = [
    ../../desktop/programs/productivity.nix
    ../../desktop/programs/development-tools.nix
    ../../desktop/programs/misc.nix
    ../../desktop/programs/console-games.nix
  ];

  home.username = "deck";
  home.homeDirectory = "/home/deck";

  targets.genericLinux.enable = true;

  home.stateVersion = "26.05";

  home.packages = [
    pkgs.mpv pkgs.yt-dlp
  ];

  programs = {
    home-manager.enable = true;
    inherit (import ../configs.nix pkgs) git;
  };
}
