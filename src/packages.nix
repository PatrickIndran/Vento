{ pkgs }:

{

# --- vento-softwareupdate ---

#softwareupdate = pkgs.writers.writePython3Bin "softwareupdate" 
#  {
#    libraries = with pkgs.python3Packages; [
#      requests 
#      pygobject3 
#      pkgs.libnotify
#      pkgs.gobject-introspection
#    ];
#    doCheck = false;
#  } 
#  (builtins.readFile ./scripts/vento-softwareupdate/softwareupdate.py);
#
#  vento-theme = pkgs.stdenv.mkDerivation {
#    name = "vento-dark-theme";
#    
#    src = ./themes/kde-plasma/org.vento.dark;
#
#    installPhase = ''
#      mkdir -p $out/share/plasma/look-and-feel/org.vento.dark
#      cp -r ./* $out/share/plasma/look-and-feel/org.vento.dark/
#      
#      mkdir -p $out/share/icons/hicolor/scalable/apps
#      cp ./icons/vento_logomart.svg $out/share/icons/hicolor/scalable/apps/vento_logomart.svg
#    '';
#  };
#

}  
  
