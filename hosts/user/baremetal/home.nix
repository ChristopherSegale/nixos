{ config, pkgs, user, drawterm, ... }:

let
  inherit (import ../programs pkgs) web-browsers virtualization containers productivity
                                    development-tools multimedia misc console-games;
in
{
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    stateVersion = "24.05";

    packages = web-browsers ++
               virtualization ++
               containers ++
               productivity ++
               development-tools ++
               multimedia ++
               misc ++
               console-games ++
	       drawterm;
  };
  programs = {
    home-manager.enable = true;

    inherit (import ../programs/config pkgs) git emacs;
  };
}
