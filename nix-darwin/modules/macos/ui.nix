{ config, pkgs, self, ... }:

{
  services.aerospace.enable = true;
  # Override the launchd command to drop the auto-generated --config-path.
  # This forces AeroSpace to fall back to the Home Manager config at ~/.config/aerospace/aerospace.toml.
  launchd.user.agents.aerospace.command = pkgs.lib.mkForce "${config.services.aerospace.package}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace";
  system = {
    defaults = {
      NSGlobalDomain = {
        _HIHideMenuBar = true;
      };
      controlcenter.BatteryShowPercentage = true;
      spaces = {
        # one space spans across all physical displays. suggested for aerospace.
        spans-displays = true;
      };
      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };
      dock = {
        autohide = true;
        largesize = 80;
        launchanim = false;
        mineffect = "scale";
        orientation = "bottom";
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        NewWindowTarget = "Home";
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
      };
      hitoolbox = {
        AppleFnUsageType = "Change Input Source";
      };
      universalaccess = {
        reduceMotion = true;
      };
    };
  };
}
