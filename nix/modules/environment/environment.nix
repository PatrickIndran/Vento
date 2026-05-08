{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./services.nix
    ./etc.nix
  ];
}
