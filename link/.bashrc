# Where the magic happens.
export DOTFILES=~/.dotfiles

# Add binaries into the path
PATH=$DOTFILES/bin:$PATH
export PATH

# Source all files in "source"
function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

# Functionality for the 'sm' command that lets one switch users but keeps its own environment
export INIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # dir this script is in
export HOME_DIR=$(eval echo ~$(id -un))                         # home dir of current user

# Make sure to use the right history file
HISTFILE=$HOME_DIR/.bash_history

# Load other user's rc and profile files if they differ from the current ones.
SMRC=$(readlink -f $HOME_DIR/.bashrc)
DMRC=$(readlink -f "${BASH_SOURCE[0]}")
if [ "$DMRC" != "$SMRC" ]; then
  SMPF=$HOME_DIR/.profile
  SMBP=$HOME_DIR/.bash_profile
  [ -f "$SMPF" ] && . "$SMPF"
  [ -f "$SMRC" ] && . "$SMRC"
  [ -f "$SMBP" ] && . "$SMBP"
fi

# Alias for switching users while keeping the environment.
alias sm="HOME=$INIT_DIR su -m"

# Use my tmux.conf if it exists
if [ -r $INIT_DIR/.tmux.conf ]; then
  alias tmux="HOME=$INIT_DIR tmux -f $INIT_DIR/.tmux.conf"
fi

src

unset INIT_DIR
export HOME=$HOME_DIR

if [[ $- == *i* ]] && command -v mise >/dev/null 2>&1; then
  eval "$(mise activate bash)"
fi

# Useful aliases and functions
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function goto_project() {
  cd ~/projects/$1
}

alias ..='cd ..'
