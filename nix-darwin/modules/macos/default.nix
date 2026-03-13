{ config, pkgs, self, ... }:

{
  imports = [
    ./ui.nix
    ./hardware.nix
    ./system.nix
    ./fonts.nix
  ];
}
