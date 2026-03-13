{  pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
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

    pkgs.lua
    pkgs.ripgrep
    pkgs.fd
    pkgs.fzf
    pkgs.cargo
    pkgs.lazygit
  ];

}
