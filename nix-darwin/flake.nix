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

      nixpkgs = {
        hostPlatform = "aarch64-darwin";
        config = {
          allowUnsupportedSystem = true;
          allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
            "discord"
            "idea-ultimate"
            "jetbrains.gateway"
            "gateway"
            "google-chrome"
            "displaylink"
            "signal-desktop"
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
        pkgs.brave
        pkgs.colima
        pkgs.lima
        pkgs.docker-compose
        pkgs.devpod
        pkgs.discord
        pkgs.git
        pkgs.findutils
        pkgs.flameshot
        pkgs.google-chrome
        pkgs.htop
        pkgs.jetbrains.gateway
        pkgs.jetbrains.idea-ultimate
        pkgs.kitty
        pkgs.mas
        pkgs.minio-client
        pkgs.mise
        pkgs.ncdu
        pkgs.neovim
        pkgs.openshift
        pkgs.p7zip
        pkgs.signal-desktop
        pkgs.sketchybar-app-font
        pkgs.tmux
        pkgs.unixtools.watch
        pkgs.utm
        pkgs.vault
        pkgs.vivid
        pkgs.vscode

        pkgs.kubeconform
        pkgs.kube-linter
        pkgs.yamllint
        pkgs.kubernetes-helm
        pkgs.yq
      ];
      # system settings
      system = {
        defaults = {
          controlcenter.BatteryShowPercentage = true;
          spaces = {
            spans-displays = true;
          };
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

        keyboard = {
          enableKeyMapping = true;
          remapCapsLockToEscape = true;
        };
      };

      security.pam = {
        enableSudoTouchIdAuth = true;
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
    darwinConfigurations = {
      "ambp" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
        ];
      };
    };
  };
}
