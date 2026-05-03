{
  description = "Vento";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    
    nixosConfigurations = {
      
      main = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nix/modules/system/system.nix
          ./nix/modules/environment/environment.nix
          ./nix/modules/environment/profiles/kde-plasma/default.nix
        ];
      };

      # --- Test VM --- 

      test-vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nix/modules/system/system.nix
          ./nix/modules/environment/environment.nix
          ./hosts/sandbox/sandbox.nix
          ./nix/modules/environment/profiles/kde-plasma/default.nix
        
        ];
      };
      
    };
  };
}
