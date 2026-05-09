{
  config,
  pkgs,
  vento-packages,
  ...
}:

{
  # --- SystemPackages ---
  environment.systemPackages = with pkgs; [

    # --- Vento Packages ---
    #vento-packages.softwareupdate
    vento-packages.theme

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
