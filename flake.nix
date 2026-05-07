{
  description = "Vento";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";

    pkgs = nixpkgs.legacyPackages.${system};
    vento-packages = import ./src/packages.nix { inherit pkgs; };
  in {
    
   
    nixosModules = {
      
      # --- Main ---

      main = {
        imports = [
          ./nix/modules/system/system.nix
          ./nix/modules/environment/environment.nix
          ./nix/modules/environment/profiles/kde-plasma/default.nix

          ({ ... }: {
            system.configurationRevision = self.rev or "dirty";
          })

        ];
      };
      
      # --- Sandbox ---    

      sandbox = {
        imports = [
          ./hosts/sandbox/sandbox.nix    
          ./nix/modules/system/system.nix
          ./nix/modules/environment/environment.nix
          ./nix/modules/environment/profiles/kde-plasma/default.nix

          
          ({ ... }: {
            system.configurationRevision = self.rev or "dirty";
          })


        ];
      };
    };

    nixosconfigurations = {
      
      main = nixpkgs.lib.nixossystem {
        inherit system;
        modules = [ self.nixosmodules.main ];
        specialargs = { inherit vento-packages; };
      };

      sandbox = nixpkgs.lib.nixossystem {
        inherit system;
        modules = [ self.nixosmodules.sandbox ];
        specialargs = { inherit vento-packages; };
      };
      
    };
  };
}
