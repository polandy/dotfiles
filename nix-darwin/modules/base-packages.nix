{ config, pkgs, lib, self, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.alacritty
    pkgs.bat
    pkgs.brave
    pkgs.docker-compose
    pkgs.devpod
    pkgs.discord
    pkgs.git
    pkgs.findutils
    pkgs.flameshot
    pkgs.google-chrome
    pkgs.htop
    pkgs.kitty
    pkgs.mas
    pkgs.mise
    pkgs.ncdu
    pkgs.neovim
    pkgs.p7zip
    pkgs.signal-desktop
    pkgs.sketchybar-app-font
    pkgs.tmux
    pkgs.unixtools.watch
    pkgs.utm
    pkgs.vivid
    pkgs.vscode

    pkgs.colima
    pkgs.lima
  ];

}