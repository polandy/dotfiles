# dotfiles related stuff
set -a PATH ~/.dotfiles/bin
set -a PATH ~/bin

# locale
set -g LANG en_US.utf8
set -x LC_ALL en_US.utf8
set -x LC_CTYPE en_US.utf8

# no greeting
set fish_greeting ""

if command -v vivid > /dev/null
    set -gx LS_COLORS (vivid generate molokai)
end
if command -v mise > /dev/null
    mise activate fish | source
end

if test -d /opt/homebrew/bin
    set -gx PATH /opt/homebrew/bin $PATH
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
abbr -a gpa 'git push --all'
abbr -a gu 'git pull --rebase'
abbr -a gl 'git lg'
abbr -a glgf "git log --color --graph --pretty format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr -a gs 'git status'
abbr -a gdt 'git difftool -y'
abbr -a gdtd 'git difftool -d'
abbr -a gd 'git diff'
abbr -a gdtc 'git difftool --cached -y'
abbr -a gm 'git commit -m'
abbr -a gcamend 'git commit --amend'
abbr -a gma 'git commit -am'
abbr -a gb 'git branch'
abbr -a gba 'git branch -a'
abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gci 'git commit'
abbr -a gr 'git rebase'
abbr -a grv 'git remote -v'
abbr -a gcd 'git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'
abbr -a glol 'git lol'
abbr -a glola 'git lola'

abbr -a gstash 'git stash'
abbr -a gua "find . -maxdepth 3 -type d -name .git | xargs dirname |xargs -P 40 -n 1 -I '{}' sh -c 'cd {}; git pull'"
abbr -a gsa "find . -maxdepth 3 -type d -name .git | xargs dirname |xargs -n 1 -I '{}' sh -c 'cd {}; git status'"
abbr -a gau "git add -u :/"
abbr -a ga "git add "
abbr -a stash "git stash "
abbr -a pop "git stash pop"

# docker stuff
abbr -a dc 'docker-compose'
abbr -a dcu 'docker-compose up'
abbr -a dcud 'docker-compose up -d'
abbr -a dclf 'docker-compose logs -f'
abbr -a dce 'docker-compose exec app'

# vim related stuff
alias vi="vim"
alias vim="nvim -p"
set -x EDITOR vi
set -x VISUAL_EDITOR nvim -p -u ~/.vim/.vimrc

# misc aliases
alias ssh="env TERM=xterm ssh"

if test -e ~/.config/fish/config_local.fish
  . ~/.config/fish/config_local.fish
end

# golang
set -g GOPATH ~/go
