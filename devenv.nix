{pkgs, ...}: {
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    gnumake
  ];

  languages.rust = {
    enable = true;
    channel = "nightly";
  };

  languages.python.enable = true;
  languages.c.enable = true;

  enterShell = ''
    git --version
    make --version
  '';
}
