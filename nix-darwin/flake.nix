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

      homebrew = {
        # Note that enabling this option does not install Homebrew, see the Homebrew website for installation instructions.
        enable = true;
        taps = [
          "FelixKratz/formulae" # used for borders and sketchybar
          "nikitabobko/tap" # used for aerospace
        ];
        brews = [
          "borders"
          "sketchybar"
          "ifstat"
          "mas"

          "geeqie"
          "hicolor-icon-theme"
        ];
        casks = [
          "aerospace"
          "docker"
          "firefox"
#          "jetbrains-gateway"
          "nextcloud"
#          "font-awesome"
          "font-fira-code-nerd-font"
          "font-hack-nerd-font"
          "logseq"
          "mongodb-compass"
          "threema"
          "whatsapp"
        ];
      };

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
        ];
      };
    };
  };
}
