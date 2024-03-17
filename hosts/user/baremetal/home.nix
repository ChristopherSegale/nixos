{ config, pkgs, user, snake, ... }:

let
  inherit (import ../programs pkgs) web-browsers virtualization containers productivity
                                    development-tools multimedia misc console-games;
  custom-packages = [ snake.packages.x86_64-linux.default ];
  emacs = pkgs.emacs-gtk;
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
               custom-packages ++
               eaf-packages;
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
      package = emacs;
    };
  };
}
