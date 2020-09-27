# Required Packages for this wayland+sway setup
* [fzf](https://github.com/junegunn/fzf): General-purpose command-line fuzzy finder used in launcher script.
* [mako](https://github.com/emersion/mako): A lightweight notification daemon for Wayland.
* [waybar](https://github.com/Alexays/Waybar): Highly customizable Wayland bar for Sway and Wlroots based compositors.
* [swayidle](https://github.com/swaywm/swayidle): This is sway's idle management daemon
* [alacritty](https://github.com/alacritty/alacritty): Fast terminal emulator.
* [clipman](https://github.com/yory8/clipman):A basic clipboard manager for Wayland. Requires wl-clipboard.
* [wl-clipboard](https://github.com/bugaevc/wl-clipboard): Implements wl-copy and wl-paste cliboard utilities. Clipman reads and writes from wl-clipboard.
* [wofi](https://github.com/mikn/wofi): A launcher/menu program for wlroots based wayland compositors. Used for amongst others in combination with clipman and to show open windows.
* [grim](https://github.com/emersion/grim): For screenshots grim, slurp and swappy are required. Grim grabs images from a Wayland compositor. 
* [slurp](https://github.com/emersion/slurp): Select a region in a Wayland compositor and print it to the standard output.
* [swappy](https://github.com/jtheoof/swappy): A Wayland native snapshot and editor tool.
* [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/), for volume control.

# Required / Suggestions for look & feel
* [Font Awesome](http://fontawesome.io/), vector font, used for icons in i3status bar
* [Yosemite San Francisco Font](https://github.com/supermarin/YosemiteSanFranciscoFont), install this font to ~/.fonts
* [Moka Icon Theme](https://snwh.org/moka)
* [redshift-wayland](https://aur.archlinux.org/packages/redshift-wayland-git/): adjusts the color temperature of your screen according to your surroundings
* [wallutils](https://github.com/xyproto/wallutils): set wallpaper

# Packages
* From official repositories:
```
# pacman -S wayland sway waybar swaylock swayidle mako alacritty wl-clipboard clipman wofi grim slurp swappy fzf pulseaudio wallutils
```
* from user repository
```bash
$ yay redshift-wayland-git
$ yay clipman
$ yay swappy
```

