{ config, pkgs, ... }:

 {
  imports = [ 
    ./packages.nix 
    ./configuration.nix
  ];

  services = {
    desktopManager.plasma6.enable = true;
    experimental.use_plasma_login_manager = true;

    xserver.enable = true;
  };
}
