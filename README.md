dotfiles
========

User configuration (shell, editor, tmux, desktop, app configs) and all package
declarations (metapac on Arch, nix-darwin on macOS) live in
[nix-darwin-config](https://github.com/polandy/nix-darwin-config) and are
managed by home-manager. See its README for building, switching and the
package management strategy.

This repo only keeps what home-manager cannot manage: root-owned system files
and a few standalone helper scripts.

## System Config Files

Some config files must be owned by root and cannot be symlinked. These live in
`system/` and are deployed via:

```bash
bin/install-system-config
```

| File | Destination | Purpose |
|------|-------------|---------|
| `system/sddm.conf.d/autologin.conf` | `/etc/sddm.conf.d/autologin.conf` | SDDM autologin |
| `system/usr-local-bin/timeshift` | `/usr/local/bin/timeshift` | Wrapper that re-exports `DBUS_SESSION_BUS_ADDRESS` so timeshift can send desktop notifications when invoked as root from a pacman hook |

## Scripts

| Path | Purpose |
|------|---------|
| `bin/install-system-config` | Deploys the files in `system/` |
| `bin/whatsapp` | Opens WhatsApp Web as a Chromium app window |
| `util/audio/` | Raise/lower volume, cycle the default audio sink |
| `util/hyprland/windows.sh` | Hyprland window switcher via wofi |
| `util/misc/toggle-touchpad.sh` | Toggle the touchpad |
| `util/screenshot/screenshot.sh` | rofi menu for grimblast screenshots (area/screen/window, clipboard or file) |
| `util/set-mouse-acceleration.sh` | Set mouse acceleration (X11/xinput only) |
| `util/waybar/` | Waybar workspace/icon scripts (home-manager ships its own copy) |

None of these scripts are referenced by the home-manager configuration.
