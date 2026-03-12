{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/syncthing.nix
    ../../modules/home-manager/ssh.nix
    ../../modules/home-manager/macos-aerospace-desktop.nix
  ];

  home.stateVersion = "24.05"; # Match a recent stable version or unstable
  home.username = "andy";
  home.homeDirectory = "/Users/andy";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
