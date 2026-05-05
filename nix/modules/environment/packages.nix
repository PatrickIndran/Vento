{ config, pkgs, ... }:

let
  vento = import ../../../src/scripts/scripts.nix { inherit pkgs; };
in
{
  # --- SystemPackages ---
  environment.systemPackages = with pkgs; [ 

    # --- Vento Scripts ---
    vento.updatenotification

    # --- essentials ---
    htop
    git
    vim
    nano
    jq

    # --- virt ---
    distrobox
  ];
}
