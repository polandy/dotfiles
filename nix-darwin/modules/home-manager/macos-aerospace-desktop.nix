{ config, pkgs, lib, ... }:

{
  imports = [
    ./aerospace.nix
    ./jankyborders.nix
    ./sketchybar.nix
  ];
}
