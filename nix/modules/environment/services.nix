{ config, pkgs, ... }: {

  # --- Services ---

  services = {
    flatpak.enable = true;
  };


  # --- Systemd ---

  systemd.services.configure-flathub-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };


  # --- Virtualisation ---
  
  virtualisation = { 
    podman = {
      enable = true;
      dockerCompat = true;
    }; 
  };



}

