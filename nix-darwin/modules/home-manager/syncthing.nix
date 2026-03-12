{ config, pkgs, ... }:

{
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
