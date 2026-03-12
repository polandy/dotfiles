{ config, pkgs, lib, self, ... }:

{
  homebrew = {
    brews = [
    ];
    casks = [
      "keepassxc"
      "docker-desktop"
    ];
  };
}
