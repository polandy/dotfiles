{ config, pkgs, lib, self, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.mas
    pkgs.sketchybar-app-font

    pkgs.google-chrome
    pkgs.raycast
    pkgs.utm
  ];

}
