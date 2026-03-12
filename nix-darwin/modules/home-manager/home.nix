{ config, pkgs, ... }:

{
  home.stateVersion = "24.05"; # Match a recent stable version or unstable
  home.username = "andy";
  home.homeDirectory = "/Users/andy";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        "homelab" = {
          id = "***REMOVED***";
        };
        "ipm" = {
          id = "***REMOVED***";
        };
        "pixel9" = {
          id = "***REMOVED***";
        };
      };
      folders = {
        "logseq-private" = {
          path = "/Users/andy/Syncthing/logseq-private";
          devices = [ "homelab" "ipm" "pixel9" ];
          ignorePerms = false; # Syncthing will sync file permissions
        };
      };
    };
  };
}
