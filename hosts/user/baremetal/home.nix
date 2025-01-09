{ config, pkgs, user, drawterm, ... }:

let
  inherit (import ../programs pkgs) web-browsers virtualization containers productivity
                                    development-tools multimedia misc console-games;
  drawterm-pkg = [ drawterm.packages.x86_64-linux.default ];
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
	       drawterm-pkg;
  };
  programs = {
    home-manager.enable = true;

    inherit (import ../programs/config pkgs) git emacs;
  };
}
