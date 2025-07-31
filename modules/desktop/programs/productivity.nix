{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ libreoffice mupdf groff ];
}
