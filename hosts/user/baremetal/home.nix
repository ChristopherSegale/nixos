{ config, pkgs, user, snake, ... }:

let
  inherit (import ../programs pkgs) web-browsers virtualization containers productivity
                                    development-tools multimedia misc console-games;
  custom-packages = [ snake.packages.x86_64-linux.default ];
in
{
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    stateVersion = "23.11";

    packages = web-browsers ++
               virtualization ++
               containers ++
               productivity ++
               development-tools ++
               multimedia ++
               misc ++
               console-games ++
               custom-packages;
  };
  programs = {
    home-manager.enable = true;

    inherit (import ../programs/config pkgs) git emacs;
  };
}
