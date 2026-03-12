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
