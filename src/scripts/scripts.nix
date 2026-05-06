{ pkgs }:

{

# --- vento-softwareupdate ---

softwareupdate = pkgs.writers.writePython3Bin "softwareupdate" 
  {
    libraries = with pkgs.python3Packages; [ 
      notify2 
    ]; 
  } 
  (builtins.readFile ./vento-softwareupdatesoftwareupdate.py);

}  
  
