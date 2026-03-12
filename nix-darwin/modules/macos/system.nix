{ config, pkgs, self, ... }:

{
  environment = {
    shells = [ pkgs.fish ];
  };
  system = {
    defaults = {
      NSGlobalDomain = {
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
      };
    };
  };
  security.pam.services = {
    sudo_local.touchIdAuth = true;
  };
}
