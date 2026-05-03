{ pkgs, config, ... }:

{
  nix.settings = {

    experimental-features = [ "nix-command" "flakes" ];

    auto-optimise-store = true;

    max-jobs = "auto";
    
    trusted-users = [ "root" "@wheel" ];
  };
}
