{ config, pkgs, ... }:

 {
  imports = [ 
    ./packages.nix 
    ./configuration.nix
  ];

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    xserver.enable = true;
  };
}
