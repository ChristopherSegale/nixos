{ config, pkgs, user, ... }:

{
  home = {
    username = user;
    homeDirectory = "/home/${user}";

    stateVersion = "24.05";

    packages = with pkgs; [
      firefox-wayland
      chromium
      kate
      neofetch
    ];
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
