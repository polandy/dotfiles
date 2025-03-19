# dotfiles related stuff
set -a PATH ~/.dotfiles/bin
set -a PATH ~/bin
set -a PATH ~/.local/bin

# no greeting
set fish_greeting ""

set -g LANG en_US.utf8
set -x LC_ALL en_US.utf8
set -x LC_CTYPE en_US.utf8

if command -v vivid > /dev/null
    set -gx LS_COLORS (vivid generate molokai)
end
if command -v mise > /dev/null
    mise activate fish | source
end

# git alias
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.cm commit
git config --global alias.st status
git config --global alias.ad add
git config --global alias.br branch
git config --global alias.subup "submodule update --init --recursive"
git config --global alias.subst "submodule status --recursive"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# abbreviations
abbr -a g 'git'
abbr -a gp 'git push'
abbr -a gu 'git pull --rebase'
abbr -a gl 'git lg'
abbr -a glgf "git log --color --graph --pretty format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr -a gs 'git status'
abbr -a gd 'git diff'
abbr -a gm 'git commit -m'
abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gr 'git rebase'
abbr -a grv 'git remote -v'
abbr -a gcd 'git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'
abbr -a glol 'git lol'
abbr -a glola 'git lola'

abbr -a stash "git stash "
abbr -a pop "git stash pop"

# docker stuff
abbr -a dc 'docker-compose'
abbr -a dcu 'docker-compose up'
abbr -a dcud 'docker-compose up -d'
abbr -a dclf 'docker-compose logs -f'
abbr -a dce 'docker-compose exec app'

# vim related stuff
alias vi="nvim -p"
alias vim="nvim -p"
set -x EDITOR nvim
set -x VISUAL_EDITOR nvim -p -u ~/.vim/.vimrc

# misc aliases
alias ssh="env TERM=xterm ssh"

if test -e ~/.config/fish/config_local.fish
  . ~/.config/fish/config_local.fish
end

# golang
set -g GOPATH ~/go

set os_name (uname -s)

# Load macOS-specific configuration
set darwin_dir = $HOME/.dotfiles/config/fish/darwin_functions
if test $os_name = "Darwin"
  set fish_greeting "Darwin fish config"
  for file in $darwin_dir/*.fish
    if test -f $file
      source $file
    end
  end
end
