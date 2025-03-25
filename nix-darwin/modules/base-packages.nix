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
    pkgs.mise
    pkgs.ncdu
    pkgs.neovim
    pkgs.p7zip
    pkgs.tmux
    pkgs.tree
    pkgs.unixtools.watch
    pkgs.vivid

    pkgs.vscode

    pkgs.brave
    pkgs.flameshot
    pkgs.signal-desktop

    pkgs.mpv

    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.ripgrep
    pkgs.fd
    pkgs.gcc
  ];

}
