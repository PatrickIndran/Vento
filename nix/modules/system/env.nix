{ config, pkgs, lib, ... }:

{
  environment.etc."os-release".text = lib.mkForce ''
    NAME="Vento"
    ID=vento
    PRETTY_NAME="Vento"
    VARIANT="Vento OS"
  '';

  system.nixos.distroName = "Vento";
}
