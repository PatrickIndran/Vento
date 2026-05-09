{ config, pkgs, ... }:

{

  environment.etc."xdg/kdeglobals".text = ''
    [KDE]
    LookAndFeelPackage=org.vento.dark.desktop

  '';

}
