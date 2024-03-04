{ config, pkgs, ... }:

let
  user = "csegale";
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
in
{
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    stateVersion = "23.11";

    packages = standard-packages;
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
