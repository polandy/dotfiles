{ pkgs, ... }:

let
  sketchyBarConfigPath = ./sketchybarrc;
  sketchyBarItemsPath = ./items;
  sketchyBarPluginsPath = ./plugins;
in
{
  home.packages = with pkgs; [
    sketchybar
    sketchybar-app-font
  ];

  home.file.".config/sketchybar/sketchybarrc" = {
    source = sketchyBarConfigPath;
    # writable = true;
  };
  home.file.".config/sketchybar/items" = {
    source = sketchyBarItemsPath;
    # writable = true;
  };
  home.file.".config/sketchybar/plugins" = {
    source = sketchyBarPluginsPath;
    # writable = true;
  };
}
