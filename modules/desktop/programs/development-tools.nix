{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ plan9port gnumake ];
}
