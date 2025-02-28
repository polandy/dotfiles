{
  description = "Andys nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { lib, pkgs, ... }: {
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      security.pam = {
        enableSudoTouchIdAuth = true;
      };

    };
  system = "aarch64-darwin";
  lib = nixpkgs.lib;
  in
  {
    # $ darwin-rebuild build --flake .#ambp
    darwinConfigurations = {
      "ambp" = nix-darwin.lib.darwinSystem {
        inherit system;
        # Pass 'self' to modules
        specialArgs = { inherit self lib; };
        modules = [
          configuration
          ./modules/system.nix
          ./modules/base-packages.nix
          ./modules/devops-packages.nix
          ./modules/base-homebrew.nix
          ./modules/devops-homebrew.nix
        ];
      };
    };
  };
}
