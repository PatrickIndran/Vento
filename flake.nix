{
  description = "Vento";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      vento-packages = import ./src/packages.nix { inherit pkgs; };
    in
    {

      nixosModules = {
        main = {
          imports = [
            ./nix/modules/system/system.nix
            ./nix/modules/environment/environment.nix
            ./nix/modules/environment/profiles/kde-plasma/default.nix
            (
              { ... }:
              {
                system.configurationRevision = self.rev or "dirty";
              }
            )
          ];
        };

        sandbox = {
          imports = [
            ./hosts/sandbox/sandbox.nix
            ./nix/modules/system/system.nix
            ./nix/modules/environment/environment.nix
            ./nix/modules/environment/profiles/kde-plasma/default.nix
            (
              { ... }:
              {
                system.configurationRevision = self.rev or "dirty";
              }
            )
          ];
        };
      };

      nixosConfigurations = {
        main = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit vento-packages; };
          modules = [ self.nixosModules.main ];
        };

        sandbox = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit vento-packages; };
          modules = [ self.nixosModules.sandbox ];
        };
      };
    };
}
