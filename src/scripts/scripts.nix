{ pkgs }:

# --- updatenotifcation ---

{

updatenotification = pkgs.writers.writePython3Bin "updatenotification" 
  {
    libraries = with pkgs.python3Packages; [ 
      notify2 
    ]; 
  } 
  (builtins.readFile ./updatenotifcation/updatenotification.py);

}  
  
