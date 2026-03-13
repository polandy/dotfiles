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
    ];
    brews = [
      "ifstat"
      "mas"
      "gemini-cli"
    ];
    casks = [
      "alacritty"
      "raycast"
      "utm"
      "visual-studio-code"
      "brave-browser"
      "stolendata-mpv"
      "firefox"
      "google-chrome"
      "logseq"
      "whatsapp"
      "claude"
    ];
  };
}
