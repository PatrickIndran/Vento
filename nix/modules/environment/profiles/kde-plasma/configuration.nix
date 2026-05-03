{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "ventoo-wallpapers";
      src = ../../../../../src/themes/kde-plasma/ventoo.dark.desktop/wallpapers;
      installPhase = ''
        mkdir -p $out/share/wallpapers
        cp -r . $out/share/wallpapers/
      '';
    })
  ];

  environment.etc."xdg/kdeglobals".text = ''
    [KDE]
    LookAndFeelPackage=org.kde.breezedark.desktop

    [General]
    ColorScheme=BreezeDark
  '';

  environment.etc."xdg/plasma-org.kde.plasma.desktop-appletsrc".text = ''
    [Containments][1][Wallpaper][org.kde.image][General]
    Image=glaze
  '';
}
