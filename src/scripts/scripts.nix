{ pkgs }:

{

# --- vento-softwareupdate ---

softwareupdate = pkgs.writers.writePython3Bin "softwareupdate" 
  {
    libraries = with pkgs.python3Packages; [
      requests 
      pygobject3 
    ];
    doCheck = false;
  } 
  (builtins.readFile ./vento-softwareupdate/softwareupdate.py);

}  
  
