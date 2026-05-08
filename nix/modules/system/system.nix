{ config, pkgs, ... }:

{
  imports = [
    ./bootloader.nix
    ./env.nix

  ];
}
