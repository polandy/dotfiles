Installation
============
```
bash -c "$(curl -fsSL https://raw.github.com/polandy/dotfiles/master/bin/dotfiles)" && source ~/.bashrc
```

## Tools

- [neovim](https://github.com/neovim/neovim)
- [termite](https://github.com/thestinger/termite)
- [fish-shell](https://github.com/fish-shell/fish-shell)
- [nvm](https://github.com/creationix/nvm)
- [gnome-keyring](https://wiki.gnome.org/Projects/GnomeKeyring) and [libsecret](https://wiki.gnome.org/Projects/Libsecret) to store secrets, passwords, keys, certificates and make them available to applications
- [vivid](https://github.com/sharkdp/vivid) generator for LS_COLORS whic is used in [config.fish](config/fish/config.fish)

## Install vim Plugins using vim-plug

1. Install [neovim](https://github.com/neovim/neovim)
2. Install [vim-plug](https://github.com/junegunn/vim-plug): `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
2. open vim
3. run ':PlugInstall'

## Install powerline fonts for airline
- [powerline-fonts](https://github.com/powerline/fonts)
