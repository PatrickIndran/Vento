{ config, pkgs, ... }:

let
  vento = import ../../../src/scripts/scripts.nix { inherit pkgs; };
in
{
  # --- SystemPackages ---
  environment.systemPackages = with pkgs; [ 

    # --- Vento Scripts ---
    vento.softwareupdate

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
}
