{ config, pkgs, lib, self, ... }:

{
  homebrew = {
    brews = [
    ];
    casks = [
      "mongodb-compass"
    ];
  };
}