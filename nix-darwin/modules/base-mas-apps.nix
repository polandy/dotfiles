{ config, pkgs, lib, self, ... }:

{
  homebrew = {
    # Note that you need to be signed into the Mac App Store for mas to successfully install and upgrade applications, 
    # and that unfortunately apps removed from this option will not be uninstalled automatically 
    # even if is set to "uninstall" or "zap" (this is currently a limitation of Homebrew Bundle).
    masApps = {
      wireguard = 1451685025;
      bitwarden = 1352778147;
    };
  };
}
