{ config, pkgs, ... }:

{


  environment.etc."xdg/kdeglobals".text = ''
    [KDE]
    LookAndFeelPackage=org.kde.breezedark.desktop

    [General]
    ColorScheme=BreezeDark
  '';

  environment.etc."xdg/plasma-org.kde.plasma.desktop-appletsrc".text = ''
    [Serialization][Industrial][Applets][2][Configuration][General]
    icon=${../../../../../src/branding/logo_designs/icons/vento_logomart/vento_logomart.svg}
  '';

}
