{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ firefox-wayland chromium floorp ];
}
