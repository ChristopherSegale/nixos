{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ crawl nethack ];
}
