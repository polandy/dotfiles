# dotfiles related stuff
set -gx PATH $PATH ~/.dotfiles/bin

# locale
set -g LANG de_CH.utf8
set -x LC_ALL de_CH.utf8
set -x LC_CTYPE de_CH.utf8

# no greeting
set fish_greeting ""

# git alias
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.cm commit
git config --global alias.st status
git config --global alias.ad add
git config --global alias.br branch
git config --global alias.subup "submodule update --init --recursive"
git config --global alias.subst "submodule status --recursive"

# NDBJS git alias
git config --global alias.s "status"
git config --global alias.br "branch"
git config --global alias.f "fetch"
git config --global alias.d "diff"
git config --global alias.dc "diff --cached"
git config --global alias.dt "difftool -y"
git config --global alias.dtc "difftool --cached -y"
git config --global alias.up "pull --rebase"
git config --global alias.co "checkout"
git config --global alias.ci "commit"
git config --global alias.rb "rebase"
git config --global alias.lol "log --graph --pretty=oneline --abbrev-commit --decorate"
git config --global alias.lola "log --graph --pretty=oneline --abbrev-commit --decorate --all"

# abbreviations
abbr -a g='git'
abbr -a gp='git push'
abbr -a gpa='git push --all'
abbr -a gu='git up'
abbr -a gl='git log'
abbr -a gs='git status'
abbr -a gdt='git dt'
abbr -a gdtd='git difftool -d'
abbr -a gd='git diff'
abbr -a gdtc='git dtc' 
abbr -a gm='git commit -m'
abbr -a gma='git commit -am'
abbr -a gb='git branch'
abbr -a gba='git branch -a'
abbr -a gc='git checkout'
abbr -a gcb='git checkout -b'
abbr -a gr='git remote'
abbr -a grv='git remote -v'
abbr -a gcd='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'
abbr -a glol='git lol'
abbr -a glola='git lola'
abbr -a gua="find . -maxdepth 3 -type d -name .git | xargs dirname |xargs -P 40 -n 1 -I '{}' sh -c 'cd {}; git pull'"
abbr -a gsa="find . -maxdepth 3 -type d -name .git | xargs dirname |xargs -n 1 -I '{}' sh -c 'cd {}; git status'"
abbr -a gau="git add -u :/"
abbr -a ga="git add "
#
# Add all files by default
function gaa
  set arg $argv .
  git add "$argv"
end

# Ruby enVironment Manager
rvm default

# Current branch or SHA if detached.
alias gbs='git branch | perl -ne '"'"'/^\* (?:\(detached from (.*)\)|(.*))/ && print "$1$2"'"'"''

# vim related stuff
alias vi="vim"
alias vim="nvim -p"
set -x EDITOR vi
set -x VISUAL_EDITOR nvim -p -u ~/.vim/.vimrc

if test -e ~/.config/fish/config_local.fish
  . ~/.config/fish/config_local.fish
end
