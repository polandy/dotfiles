{ config, pkgs, lib, self, ... }:

{
  homebrew = {
    brews = [
    ];
    casks = [
      "nextcloud"
      "digikam"
      "fujifilm-x-raw-studio"
      "steam"
    ];
  };
}
