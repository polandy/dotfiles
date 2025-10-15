{
  description = "Andys nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    system = "aarch64-darwin";
    lib = nixpkgs.lib;
    primaryUser = "andy";
  in
  {
    # $ darwin-rebuild build --flake .#ambp
    darwinConfigurations = {
      "ambp" = nix-darwin.lib.darwinSystem {
        inherit system;
        # Pass 'self' to modules
        specialArgs = { inherit self lib; };
        modules = [
          ./modules/default.nix
          ./modules/macos.nix
          ./modules/base-packages.nix
          ./modules/devops-packages.nix
          ./modules/base-homebrew.nix
          ./modules/devops-homebrew.nix

          { # Inline module to disable Nix
            nix.enable = false;
          }
        ];
      };
      "amba" = nix-darwin.lib.darwinSystem {
        inherit system;
        # Pass 'self' to modules
        specialArgs = { inherit self lib primaryUser; };
        modules = [
          ./modules/default.nix
          ./modules/macos.nix
          ./modules/base-packages.nix
          ./modules/base-homebrew.nix
          ./modules/personal-packages.nix
          ./modules/personal-homebrew.nix
          ./modules/hoeme-manager

          { # Inline module to disable Nix
            nix.enable = false;
          }
        ];

      };
    };
  };
}
