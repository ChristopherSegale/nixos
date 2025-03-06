pkgs:

with pkgs; {
  web-browsers = [
    firefox-wayland
    chromium
    floorp
  ];
  virtualization = [
    qemu
  ];
  containers = [
    podman
    distrobox
  ];
  productivity = [
    libreoffice
    mupdf
    groff
  ];
  productivity-lite = [
    mupdf
    groff
  ];
  development-tools = [
    plan9port
    gnumake
  ];
  multimedia = [
    mpv
    yt-dlp
  ];
  misc = [
    fastfetch
  ];
  console-games = [
    crawl
    nethack
  ];
}
