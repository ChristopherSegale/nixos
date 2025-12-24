pkgs:

{
  git = {
    enable = true;
    settings.user = {
      name = "ChristopherSegale";
      email = "ccs.segale@gmail.com";
    };
  };

  emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}
