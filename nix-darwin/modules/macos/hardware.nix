{ config, pkgs, self, ... }:

{
  system = {
    defaults = {
      NSGlobalDomain = {
        InitialKeyRepeat = 15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        KeyRepeat = 4;         # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)
        "com.apple.keyboard.fnState" = true;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.swipescrolldirection" = false;
      };
      trackpad = {
        # enable trackpad tap to click
        Clicking = true;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
