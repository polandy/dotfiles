export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"	# dir this script is in
export HOME=$(eval echo ~$(id -un))	# home dir of current user

# Source local specific stuff
if [ -f $DIR/.bashrc_local ]; then
  . $DIR/.bashrc_local
fi

# make sure to use right history file
HISTFILE=$HOME/.bash_history

# Source global definitions
#if [ -f /etc/bashrc ]; then
#  . /etc/bashrc
#fi


# Load other user's rc and profile file
SMRC=$(readlink -f $HOME/.bashrc)
DMRC=$(readlink -f "${BASH_SOURCE[0]}")
if [ $DMRC != $SMRC ]; then
  SMPF=$HOME/.profile
  SMBP=$HOME/.bash_profile
  [ -f $SMPF ] && . $SMPF
  [ -f $SMRC ] && . $SMRC
  [ -f $SMBP ] && . $SMBP
fi

# Source bash completion stuff
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

set -o notify # Report status of terminated bg jobs immediately
set -o vi # vi mode

shopt -s extglob # extended pattern matching features
shopt -s cdspell # correct dir spelling errors on cd
shopt -s lithist # save multi-line commands with newlines
shopt -s autocd # if a command is a dir name, cd to it
shopt -s checkjobs # print warning if jobs are running on shell exit
shopt -s dirspell # correct dir spelling errors on completion
shopt -s globstar # ** matches all files, dirs and subdirs
shopt -s cmdhist # save multi-line commands in a single hist entry
shopt -s checkwinsize # check the window size after each command
shopt -s no_empty_cmd_completion # don't try to complete empty cmds

#coloured man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# define some colours
GREY=$'\033[1;30m'
RED=$'\033[1;31m'
GREEN=$'\033[1;32m'
YELLOW=$'\033[1;33m'
BLUE=$'\033[1;34m'
MAGENTA=$'\033[1;35m'
CYAN=$'\033[1;36m'
WHITE=$'\033[1;37m'
NONE=$'\033[m'

#random grep color
export GREP_COLOR="1;3$((RANDOM%6+1))"
export GRC_HOME=~/.grc

# PS1='`id -un`@$HOSTNAME: $PWD#' # f.e: joschi@host-a: /home/joschi#
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '	# PS1 with color

# Some useful aliases
alias ll='ls -lsh'
alias la='ls -lsah'
alias lr='ls -lsahtr'
alias mv='mv'
alias cp='cp -r'
alias rrd='/usr/local/rrdtool/bin/rrdtool'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias sm="HOME=$DIR su -m"
alias vim="vim -p -u $DIR/.vim/.vimrc"
alias vi=vim
alias grep='grep --color=auto'
alias bash="bash --rcfile $DIR/.bashrc"

# vim related vars
export EDITOR=vim
export VISUAL_EDITOR=vim

# use my tmux.conf if it exists
if [ -r $DIR/.tmux.conf ]; then
  alias tmux="HOME=$DIR tmux -f $DIR/.tmux.conf"
fi

# format json
jsonformat() {
	cat $1 | perl -0007 -MJSON -ne 'print to_json(from_json($_, {allow_nonref=>1}), {pretty=>1})'
}

# download speed of a file
speed() {
	while [ 1 ]
	do 
		old=$(du -k $1 |cut -d"/" -f1)
		sleep 1
		new=$(du -k $1 |cut -d"/" -f1)
		speed=$(expr $new - $old)
		size=$(du -h $1 |cut -d"/" -f1)
		echo "$speed KB/s - $size"
	done
}

# Show only the top entries of a directory
lh () {
  ll $1 |head -$2
}

# Show only the top entries of a directory
lht () {
  ll -t $1 |head -$2
}

# Show only the last entries of a directory
lt () {
  ll $1 |tail -$2
}

# Show only the last entries of a directory (time sorted
ltt () {
  ll -t $1 |tail -$2
}

unset DIR

cd $HOME
