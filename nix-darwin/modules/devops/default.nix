{ config, pkgs, lib, self, ... }:

{
  imports = [
    ./packages.nix
    ./homebrew.nix
  ];
}
