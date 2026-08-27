{pkgs, ...}: {
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    gnumake
    # needed for all numworks projects
    gcc-arm-embedded
  ];

  languages.rust = {
    enable = true;
    channel = "nightly";
    targets = ["thumbv7em-none-eabihf"];
  };

  languages.python.enable = true;
  languages.c.enable = true;

  enterShell = ''
    git --version
    make --version
  '';
}
