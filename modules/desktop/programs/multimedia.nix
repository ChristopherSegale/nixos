{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ mpv yt-dlp ];
}
