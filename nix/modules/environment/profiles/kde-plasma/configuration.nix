{ config, pkgs, ... }:

{
  environment.etc."ventoo/assets/wallpapers/glaze_1.heic".source = 
    ../../../../../src/themes/kde-plasma/ventoo.dark.desktop/wallpapers/glaze_1.heic;

  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "ventoo-plasma-theme";
      src = ../../../../../src/themes/kde-plasma/ventoo.dark.desktop/look-and-feel;
      installPhase = ''
        mkdir -p $out/share/plasma/look-and-feel
        cp -r VentooThemeDark $out/share/plasma/look-and-feel/org.ventoo.dark.desktop
      '';
    })
  ];

  environment.etc."xdg/kdeglobals".text = ''
    [KDE]
    LookAndFeelPackage=org.ventoo.dark.desktop
  '';

}
