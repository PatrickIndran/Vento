{ pkgs }:

{
  theme = pkgs.callPackage ./themes/kde-plasma/vento-theme/package.nix { };
}
