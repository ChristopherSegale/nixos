{ config, pkgs, user, snake, ... }:

let
  web-browsers = with pkgs; [
    firefox-wayland
    chromium
  ];
  virtualization = with pkgs; [
    qemu
  ];
  containers = with pkgs; [
    podman
    distrobox
  ];
  productivity = with pkgs; [
    libreoffice
    mupdf
    groff
  ];
  development-tools = with pkgs; [
    plan9port
    gnumake
  ];
  multimedia = with pkgs; [
    mpv
    yt-dlp
  ];
  misc = with pkgs; [
    neofetch;
  ];
  console-games = with pkgs; [
    crawl
    nethack
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
  ]));
  eaf-packages = with pkgs; [ nodejs wmctrl xdotool python-dependencies ];
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
