{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ unrar unzip ];
}
