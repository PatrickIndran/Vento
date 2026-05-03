{ config, pkgs, ... }:

{
  imports = [ 
    ./bootloader.nix
    ./nixenv.nix
  ];
}
