{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "ventoo-wallpapers";
      src = ../../../../../src/themes/kde-plasma/ventoo.dark.desktop/wallpapers;
      installPhase = ''
        cp -r . $out/share/wallpapers/
      '';
    })

    (pkgs.stdenv.mkDerivation {
      name = "ventoo-plasma-theme";
      src = ../../../../../src/themes/kde-plasma/ventoo.dark.desktop/look-and-feel;
      installPhase = ''
        cp -r org.ventoo.dark.desktop $out/share/plasma/look-and-feel/org.ventoo.dark.desktop
      '';
    })
  ];

  environment.etc."xdg/kdeglobals".text = ''
    [KDE]
    LookAndFeelPackage=org.ventoo.dark.desktop
  '';
}
