{ config, pkgs, self, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";


  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

  environment.variables = {
    editor = "nvim";
    LANG = "en_US.UTF-8";
  };

}
