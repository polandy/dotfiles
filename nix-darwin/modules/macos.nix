{ config, pkgs, self, ... }:

{
  environment = {
    shells = [ pkgs.fish ];
  };
  system = {
    primaryUser = "andy";
    defaults = {
      NSGlobalDomain = {
        InitialKeyRepeat = 15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        KeyRepeat = 4;         # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        _HIHideMenuBar = true;
        "com.apple.keyboard.fnState" = true;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.swipescrolldirection" = false;
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
      trackpad = {
        # enable trackpad tap to click
        Clicking = true;
      };
      universalaccess = {
        reduceMotion = true;
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
