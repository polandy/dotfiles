{ config, pkgs, lib, self, ... }:

{
  homebrew = {
    # Note that enabling this option does not install Homebrew, see the Homebrew website for installation instructions.
    enable = true;
    # This uninstalls all formulae not listed in the generated Brewfile,
    # and if the formula is a cask, removes all files associated with that cask.
    # In other words, brew uninstall --zap is run for all those formulae.
    onActivation.cleanup = "zap";
    taps = [
      "FelixKratz/formulae" # used for borders and sketchybar
      "nikitabobko/tap" # used for aerospace
    ];
    brews = [
      "borders"
      "sketchybar"
      "ifstat"
      "mas"

      "geeqie"
      "hicolor-icon-theme"
    ];
    casks = [
      "aerospace"
      "docker"
      "firefox"
      "nextcloud"
      "font-fira-code-nerd-font"
      "font-hack-nerd-font"
      "logseq"
      "threema"
      "whatsapp"
    ];
  };
}