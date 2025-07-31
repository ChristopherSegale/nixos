{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ podman distrobox ];
}
