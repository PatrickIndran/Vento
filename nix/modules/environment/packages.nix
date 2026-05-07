{ config, pkgs, ... }:


{
  # --- SystemPackages ---
  environment.systemPackages = with pkgs; [ 

    # --- Vento Scripts ---
    vento-packages.softwareupdate

    # --- essentials ---
    jq
    curl
    wget

    # --- Quility Of Life ---
    fastfetch
    htop
    git
    vim
    nano

    # --- virt ---
    distrobox

  ];

  programs = {
    kdeconnect.enable = true;
  };

}
