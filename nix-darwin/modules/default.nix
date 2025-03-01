{ config, pkgs, self, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

    system = {
      # Set Git commit hash for darwin-version.
      configurationRevision = self.rev or self.dirtyRev or null;
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      stateVersion = 5;
    };

}