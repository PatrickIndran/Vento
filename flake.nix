{
  description = "Vento";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
  in {
    
   
    nixosModules = {
      
      # --- Main ---

      main = {
        imports = [
          ./nix/modules/system/system.nix
          ./nix/modules/environment/environment.nix
          ./nix/modules/environment/profiles/kde-plasma/default.nix
        ];
      };
      
      # --- Sandbox ---    

      sandbox = {
        imports = [
          ./hosts/sandbox/sandbox.nix    
          ./nix/modules/system/system.nix
          ./nix/modules/environment/environment.nix
          ./nix/modules/environment/profiles/kde-plasma/default.nix
          ];
      };
    };

    nixosConfigurations = {
      
      main = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ self.nixosModules.main ];
      };

      sandbox = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ self.nixosModules.sandbox ];
      };
      
    };
  };
}
