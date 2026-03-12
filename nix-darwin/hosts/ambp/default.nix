{ config, pkgs, lib, self, home-manager, ... }:

{
  imports = [
    ../../modules/base
    ../../modules/macos
    ../../modules/devops
    home-manager.darwinModules.home-manager
  ];

  # These are nix-darwin options that tell the macOS system builder how to integrate with Home Manager.
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.andy = import ./home.nix;
}
