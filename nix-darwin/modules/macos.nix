{ config, pkgs, self, ... }:

{
  environment = {
    shells = [ pkgs.fish ];
  };
  system = {
    defaults = {
      NSGlobalDomain = {
        _HIHideMenuBar = true;
        "com.apple.keyboard.fnState" = true;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.swipescrolldirection" = false;
      };
      controlcenter.BatteryShowPercentage = true;
      spaces = {
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
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
  security.pam.services = {
    sudo_local.touchIdAuth = true;
  };
}
