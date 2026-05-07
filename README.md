# Vento

> **Work in progress.** Expect breaking changes.

An immutable, flake based desktop built on **NixOS**. Ventoo provides a rock-solid core designed for reliability and newcomers.

## Features

*   **Immutable Core**: Built on NixOS for a read-only system root that stays consistent.
*   **KDE Plasma**: A familiar, powerful, and user-friendly desktop environment out of the box.
*   **Containerization Ready**: Native support for `distrobox` and `podman`.
*   **Atomic Reliability**: Every change is tracked; if an update fails, just roll back to the previous generation.
    **Flatpak And DistroBox**: Allows users to install apps with ease.

## Planned

*   **vento CLI**: A dedicated tool for simplified patch and system management.
*   **Custom Installer**: A more easy way to install it then adding it as a Flake.
*   **Update Notfication**: Simple way to update the system, without any terminal commands.

# Installation

1. To install this config, add `vento.url = "github:patrickindran/vento";` to your inputs and `vento.nixosModules.main` to your modules in your flake.
2. Run `sudo nix flake update` and then `sudo nixos-rebuild switch --flake .#vento`.

```
{
  description = "Vento";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    vento.url = "github:patrickindran/vento";
  };

  outputs = { self, nixpkgs, vento, ... }: {
    nixosConfigurations = {
      vento = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          vento.nixosModules.main
        ];
      };
    };
  };
}
