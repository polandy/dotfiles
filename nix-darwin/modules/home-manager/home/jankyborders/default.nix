{ pkgs, ... }:

let
  jankyBordersConfigPath = ./bordersrc;
in
{
  home.packages = with pkgs; [
    jankyborders
  ];

  home.file.".config/borders/bordersrc" = {
    source = jankyBordersConfigPath;
    # writable = true;
  };
}
