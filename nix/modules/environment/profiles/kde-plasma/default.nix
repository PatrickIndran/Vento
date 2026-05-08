{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./configuration.nix
  ];

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;

    xserver.enable = true;
  };
}
