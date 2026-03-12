{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    sketchybar
    sketchybar-app-font
  ];

  xdg.configFile."sketchybar" = {
    source = ./sketchybar_config;
    recursive = true;
  };
}
