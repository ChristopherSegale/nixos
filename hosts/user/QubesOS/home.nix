{ config, pkgs, user, ... }:

{
  home = {
    username = user;
    homeDirectory = "/home/${user}";

    stateVersion = "23.11";

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
  };
}
