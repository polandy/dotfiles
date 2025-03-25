{ config, pkgs, lib, self, ... }:

{ 
  programs.sway.enable = true;

  environment.systemPackages = with pkgs; [
    wofi
  ];

}
