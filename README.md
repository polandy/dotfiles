Installation
============

```

bash -c "$(curl -fsSL https://raw.github.com/polandy/dotfiles/master/bin/dotfiles)" && source ~/.bashrc
```

## Tools

- [neovim](https://github.com/neovim/neovim)
- [alacritty](https://github.com/alacritty/alacritty)
- [fish-shell](https://github.com/fish-shell/fish-shell)
- [mise-en-place](https://github.com/creationix/nvm)
- [gnome-keyring](https://wiki.gnome.org/Projects/GnomeKeyring) and [libsecret](https://wiki.gnome.org/Projects/Libsecret) to store secrets, passwords, keys, certificates and make them available to applications
- [vivid](https://github.com/sharkdp/vivid) generator for LS_COLORS which is used in [config.fish](config/fish/config.fish)

## Install powerline fonts for airline

- [powerline-fonts](https://github.com/powerline/fonts)

## Package Management Strategy (Linux)

On Arch Linux, two package managers coexist:

| Manager | What goes here |
|---------|---------------|
| **yay/metapac** (this repo) | AUR packages, system daemons and drivers, anything requiring pacman hooks or systemd system units |
| **home-manager** ([nix-config repo](https://github.com/polandy/nix-darwin-config)) | User-level tools and apps available in nixpkgs, dotfile/config management |

**Rule of thumb:** if it's AUR (e.g. `-bin`, `-git` suffixes) or touches the system (kernel, display manager, portals, bluetooth), it stays here. If it's in nixpkgs and user-level, it belongs in home-manager.

## Nix Darwin

### Build and Switch

```bash
darwin-rebuild switch --flake ~/.dotfiles/nix-darwin#amba
```

### Maintenance and Rollback

To list all generations:
```bash
darwin-rebuild --list-generations
```

To rollback to the previous generation:
```bash
darwin-rebuild switch --rollback
```

To switch to a specific generation:
```bash
darwin-rebuild switch --switch-generation <number>
```
