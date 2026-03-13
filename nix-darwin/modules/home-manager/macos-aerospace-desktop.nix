{ config, pkgs, lib, ... }:

{
  imports = [
    ./aerospace.nix
    ./jankyborders.nix
    ./sketchybar.nix
  ];

  home.packages = with pkgs; [
    aerospace
    sketchybar
    jankyborders
    sketchybar-app-font
  ];
}
