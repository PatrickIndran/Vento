{ config, pkgs, ... }: {

  # --- SystemPackages ---
  environment.systemPackages = with pkgs; [ 

    # --- essentials ---
    htop
    git
    vim
    nano
  ];

  
}

