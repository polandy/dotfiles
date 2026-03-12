{ config, pkgs, lib, self, home-manager, ... }:

{
  imports = [
    ../../modules/base
    ../../modules/macos
    ../../modules/devops
  ];
}
