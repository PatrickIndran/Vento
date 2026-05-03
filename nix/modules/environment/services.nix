{ config, pkgs, ... }: {

  # --- Services ---

  services = {
    flatpak.enable = true;
  };

  # --- Virtualisation ---
  
  virtualisation = { 
    podman = {
      enable = true;
      dockerCompat = true;
    }; 
  };



}

