{ config, pkgs, user, emacs-config, ... }:

let
  inherit (import ../programs pkgs) web-browsers containers productivity-lite development-tools misc;
in
{
  home = {
    username = user;
    homeDirectory = "/home/${user}";

    stateVersion = "23.11";

    packages = web-browsers ++
               containers ++
               productivity-lite ++
               development-tools ++
               misc;

    file.".config/emacs".source = emacs-config;
    file.".config/emacs".recursive = true;
  };

  programs = {
    home-manager.enable = true;

    inherit (import ../programs/config pkgs) git emacs;
  };
}
