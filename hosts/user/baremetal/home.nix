{ config, pkgs, user, snake, ... }:

let
  standard-packages = with pkgs; [
    firefox-wayland
    chromium
    qemu
    podman
    distrobox
    libreoffice
    plan9port
    groff
    gnumake
    mupdf
    neofetch
    mpv
    yt-dlp
  ];
  custom-packages = [ snake.packages.x86_64-linux.default ];
in
{
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    stateVersion = "24.05";

    packages = standard-packages ++
               custom-packages;
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
      packages = pkgs.emacs;
    };
  };
}
