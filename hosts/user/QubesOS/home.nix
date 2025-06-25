{ config, pkgs, user, ... }:

let
  inherit (import ../programs pkgs) web-browsers containers productivity-lite development-tools misc;
in
{
  home = {
    username = user;
    homeDirectory = "/home/${user}";

    stateVersion = "25.05";

    packages = web-browsers ++
               containers ++
               productivity-lite ++
               development-tools ++
               misc;
  };

  programs = {
    home-manager.enable = true;

    inherit (import ../programs/config pkgs) git emacs;
  };
}
