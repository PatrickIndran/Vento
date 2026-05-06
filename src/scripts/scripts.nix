{ pkgs }:

{

# --- vento-softwareupdate ---

softwareupdate = pkgs.writers.writePython3Bin "softwareupdate" 
  {
    libraries = with pkgs.python3Packages; [
      requests 
      pygobject3 
      pkgs.libnotify
      pkgs.gobject-introspection
    ];

    makeWrapperArgs = [
      "--prefix GI_TYPELIB_PATH : ${pkgs.libnotify}/lib/girepository-1.0:${pkgs.gobject_introspection}/lib/girepository-1.0"
    ];
    doCheck = false;
  } 
  (builtins.readFile ./vento-softwareupdate/softwareupdate.py);

}  
  
