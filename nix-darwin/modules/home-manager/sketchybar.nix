{ config, pkgs, lib, ... }:

{
  xdg.configFile."sketchybar" = {
    source = ./sketchybar_config;
    recursive = true;
  };
}
