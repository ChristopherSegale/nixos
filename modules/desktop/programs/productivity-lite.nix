{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ mupdf groff ];
}
