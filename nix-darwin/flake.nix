{
  description = "Andys nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin";
    lib = nixpkgs.lib;
  in
  {
    # $ darwin-rebuild build --flake .#ambp
    darwinConfigurations = {
      "ambp" = nix-darwin.lib.darwinSystem {
        inherit system;
        # Pass 'self' to modules
        specialArgs = { inherit self lib home-manager; };
        modules = [
          ./hosts/ambp

          { # Inline module to disable Nix
            nix.enable = false;
          }
        ];
        };
        "amba" = nix-darwin.lib.darwinSystem {
        inherit system;
        # Pass 'self' to modules
        specialArgs = { inherit self lib home-manager; };
        modules = [
          ./hosts/amba

          { # Inline module to disable Nix
            nix.enable = false;
          }
        ];

      };
    };
  };
}
