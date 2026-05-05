{ pkgs }:

# --- updatenotifcation ---

{

updatenotification = pkgs.writers.writePython3Bin "updatenotifcation" 
  {
    libraries = with pkgs.python3Packages; [ 
      notify2 
    ]; 
  } 
  (builtins.readFile ./updatenotification/updatenotifcation.py);

}  
  
