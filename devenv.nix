{pkgs, ...}: {
  # nwlink c version mismatch
  env.CXXFLAGS = "-std=c++20";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    gnumake
    udev
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
    npm.install.enable = true;
    #package = pkgs.nodejs_22;
  };

  languages.python.enable = true;
  languages.c.enable = true;

  enterShell = ''
    export PATH="$DEVENV_ROOT/node_modules/.bin:$PATH"
    git --version
    make --version
    rustc --version
    node --version
    npm --version
  '';
}
