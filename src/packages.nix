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
    doCheck = false;
  } 
  (builtins.readFile ./scripts/vento-softwareupdate/softwareupdate.py);

}  
  
