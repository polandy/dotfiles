{  pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.alacritty
    pkgs.bat
    pkgs.coreutils # gnu core utilities
    pkgs.git
    pkgs.findutils
    pkgs.gnused
    pkgs.htop
    pkgs.mas
    pkgs.mise
    pkgs.ncdu
    pkgs.neovim
    pkgs.p7zip
    pkgs.tmux
    pkgs.tree
    pkgs.unixtools.watch
    pkgs.wget
    pkgs.vivid

    pkgs.raycast
    pkgs.utm
    pkgs.vscode

    pkgs.brave
    pkgs.google-chrome

    pkgs.mpv

    pkgs.lua
    pkgs.sketchybar-app-font
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.ripgrep
    pkgs.fd
    pkgs.fzf
    pkgs.cargo
    pkgs.lazygit
  ];

}
