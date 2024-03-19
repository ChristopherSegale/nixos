{ config, pkgs, user, ... }:

let
  inherit (import ../programs pkgs) web-browsers misc;
in
{
  home = {
    username = user;
    homeDirectory = "/home/${user}";

    stateVersion = "24.05";

    packages = web-browsers ++
               misc;
  };

  programs = {
    home-manager.enable = true;

    inherit (import ../programs/config pkgs)  git emacs;
  };
}
