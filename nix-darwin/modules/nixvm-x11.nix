{ config, pkgs, lib, self, ... }:

{ 
  environment.systemPackages = with pkgs; [
    spice-vdagent
    spice-autorandr
  ];
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
#      windowManager.i3 = {
#        enable = true;
#        extraPackages = with pkgs; [
#          i3status
#          rofi
#        ];
#      };
      desktopManager = {
        xterm.enable = false;
        plasma6 = {
            enable = true;
          };
#        xfce = {
#          enable = true;
#          noDesktop = true;
#          enableXfwm = false;
#        };
      };
      displayManager = {
        sddm.enable = true;
#        defaultSession = "xfce+i3";
      };
    };
  };

}
