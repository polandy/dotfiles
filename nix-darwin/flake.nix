{
  description = "Andys nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
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
        specialArgs = { inherit self lib; };
        modules = [
          ./modules/default.nix
          ./modules/base-packages.nix
          ./modules/devops-packages.nix
          ./modules/base-homebrew.nix
          ./modules/devops-homebrew.nix
          ./modules/macos.nix
        ];
      };
      "amba" = nix-darwin.lib.darwinSystem {
        inherit system;
        # Pass 'self' to modules
        specialArgs = { inherit self lib; };
        modules = [
          ./modules/default.nix
          ./modules/base-packages.nix
          ./modules/base-homebrew.nix
          ./modules/macos.nix
        ];
      };
    };
  };
}
