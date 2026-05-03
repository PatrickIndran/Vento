{ config, pkgs, lib, ... }:

{
  # Update OS branding for settings menus
  environment.etc."os-release".text = lib.mkForce ''
    NAME="Vento"
    ID=vento
    PRETTY_NAME="Vento"
    VARIANT="Vento OS"
  '';

  # Update bootloader labels
  system.nixos.distroName = "Vento";
}
