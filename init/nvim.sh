if [[ -e ~/.config/nvim ]]; then
  e_arrow "Backing up ~/.config/nvim"
  # Set backup flag, so a nice message can be shown at the end.
  backup=1
  # Create backup dir if it doesn't already exist.
  [[ -e "$backup_dir" ]] || mkdir -p "$backup_dir"
  # Backup file / link / whatever.
  mv ~/.config/nvim "$backup_dir"
fi

ln -s $DOTFILES/link/.vim ~/.config/nvim
