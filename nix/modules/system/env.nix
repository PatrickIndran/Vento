{ config, pkgs, lib, ... }:

{
  environment.etc."os-release".text = lib.mkForce ''
    NAME="Vento"
    ID=vento
    ID_LIKE=nixos
    PRETTY_NAME="Vento"
    VARIANT="Vento KDE"
  '';

  system.nixos.distroName = "Vento";
}
