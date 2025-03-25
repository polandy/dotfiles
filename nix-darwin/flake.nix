{
  description = "Andys nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, ... }:
  let
    system = "aarch64-darwin";
    lib = nixpkgs.lib;
  in
  {
    darwinConfigurations = {
      "ambp" = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit self lib; };
        modules = [
          ./modules/default.nix
          ./modules/darwin-default.nix
          ./modules/macos.nix
          ./modules/base-packages.nix
          ./modules/base-darwin-packages.nix
          ./modules/devops-packages.nix
          ./modules/base-homebrew.nix
          ./modules/devops-homebrew.nix
        ];
      };
      "amba" = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit self lib; };
        modules = [
          ./modules/default.nix
          ./modules/darwin-default.nix
          ./modules/macos.nix
          ./modules/base-packages.nix
          ./modules/base-darwin-packages.nix
          ./modules/base-homebrew.nix
          ./modules/personal-packages.nix
          ./modules/personal-homebrew.nix
          {
            nix.enable = false;
          }
        ];
      };
    };

    nixosConfigurations.nixvm = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./modules/default.nix
        ./modules/base-packages.nix
        ./modules/devops-packages.nix
        ./modules/nixvm-configuration.nix
        ./modules/nixvm-hardware-configuration.nix
        ./modules/nixvm-andy.nix
      ];
    };
  };
}
