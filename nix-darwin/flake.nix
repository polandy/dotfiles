{
  description = "Andys nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = { url = "github:homebrew/homebrew-core"; flake = false; };
    homebrew-cask = { url = "github:homebrew/homebrew-cask"; flake = false;  };
    homebrew-bundle = { url = "github:homebrew/homebrew-bundle"; flake = false; };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle }:
  let
    configuration = { lib, pkgs, ... }: {
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      homebrew = {
        enable= true;
        casks = [
          "docker"
          "firefox"
          "mongodb-compass"
        ];
      };

      nixpkgs = {
        hostPlatform = "aarch64-darwin";
        config = {
          allowUnsupportedSystem = true;
          allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
            "idea-ultimate"
            "google-chrome"
            "displaylink"
            "vault"
            "vscode"
          ];
        };
      };
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
        pkgs.alacritty
        pkgs.bat
        pkgs.git
        pkgs.google-chrome
        pkgs.htop
        pkgs.jetbrains.idea-ultimate
        pkgs.kitty
        pkgs.mise
        pkgs.ncdu
        pkgs.neovim
        pkgs.openshift
        pkgs.p7zip
        pkgs.tmux
        pkgs.vault
        pkgs.vim
        pkgs.vscode
      ];
      # system settings
      system.defaults = {
        controlcenter.BatteryShowPercentage = true;
        WindowManager = {
          EnableStandardClickToShowDesktop = false;
          StandardHideDesktopIcons = true;
          StandardHideWidgets = true;
        };
        dock = {
          autohide = true;
          largesize = 80;
          launchanim = false;
          mineffect = "scale";
          orientation = "bottom";
        };
        finder = {
          AppleShowAllExtensions = true;
          AppleShowAllFiles = true;
          CreateDesktop = false;
          NewWindowTarget = "Home";
          FXDefaultSearchScope = "SCcf";
          FXEnableExtensionChangeWarning = false;
          QuitMenuItem = true;
          ShowPathbar = true;
          ShowStatusBar = true;
          _FXShowPosixPathInTitle = true;
        };
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;
    };
  in
  {
    # $ darwin-rebuild build --flake .#ambp
    darwinConfigurations."ambp" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "andy";
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
            };
            mutableTaps = false;
          };
        }
      ];
    };
    darwinPackages = self.darwinConfigurations."ambp".pkgs;
  };
}
