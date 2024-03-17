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

    git = {
      enable = true;
      userName = "ChristopherSegale";
      userEmail = "ccs.segale@gmail.com";
    };
    emacs = {
      enable = true;
      package = pkgs.emacs;
    };
  };
}
