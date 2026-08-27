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

  # needed for nwlink
  languages.javascript = {
    enable = true;
    nodejs.enable = true;
    npm.enable = true;
  };

  languages.python.enable = true;
  languages.c.enable = true;

  enterShell = ''
    git --version
    make --version
    rustc --version
    node --version
    npm --version
  '';
}
