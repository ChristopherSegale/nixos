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
  # EAF dependencies
  python-dependencies = (pkgs.python3.withPackages (python-pkgs: [
    python-pkgs.pandas
    python-pkgs.requests
    python-pkgs.sexpdata
    python-pkgs.tld
    python-pkgs.pyqt6
    python-pkgs.pyqt6-sip
    python-pkgs.pyqt6-webengine python-pkgs.epc python-pkgs.lxml # for eaf
    python-pkgs.qrcode # eaf-file-browser
    python-pkgs.pysocks # eaf-browser
    python-pkgs.pymupdf # eaf-pdf-viewer
    python-pkgs.pypinyin # eaf-file-manager
    python-pkgs.psutil # eaf-system-monitor
    python-pkgs.retry # eaf-markdown-previewer
    python-pkgs.markdown
    python-pkgs.qtconsole
  ]));
  eaf-packages = with pkgs; [ nodejs wmctrl xdotool python-dependencies ];
  emacs = pkgs.emacs-gtk;
in
{
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    stateVersion = "24.05";

    packages = standard-packages ++
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
