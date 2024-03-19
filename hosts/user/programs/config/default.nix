pkgs:

{
  home-manager.enable = true;

  git = {
    enable = true;
    userName = "ChristopherSegale";
    userEmail = "ccs.segale@gmail.com";
  };
  emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}