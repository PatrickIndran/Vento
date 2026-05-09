{ stdenv, ... }:

stdenv.mkDerivation {
  pname = "vento-theme";
  version = "1.0";
  
  srcs = [ 
    ./lnf
    ./wallpapers
  ];

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/share/plasma/look-and-feel
    mkdir -p $out/share/plasma/wallpapers

    cp -r lnf $out/share/plasma/look-and-feel/

    cp -r wallpapers $out/share/wallpapers/
  '';
}

