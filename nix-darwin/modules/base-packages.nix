{ config, pkgs, lib, self, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.alacritty
    pkgs.bat
    pkgs.docker-compose
    pkgs.git
    pkgs.findutils
    pkgs.htop
    pkgs.mas
    pkgs.mise
    pkgs.ncdu
    pkgs.neovim
    pkgs.p7zip
    pkgs.tmux
    pkgs.unixtools.watch
    pkgs.vivid
    pkgs.sketchybar-app-font

    pkgs.raycast
    pkgs.utm
    pkgs.vscode

    pkgs.brave
    pkgs.flameshot
    pkgs.google-chrome
    pkgs.signal-desktop

    pkgs.colima
    pkgs.lima

    pkgs.mpv
  ];

}
