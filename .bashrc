export EDITOR=/usr/bin/vim

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# only on Mac OS X
if [ `uname` = "Darwin" ]
then
	export CLICOLOR=1
	export LSCOLORS=ExFxCxDxBxegedabagacad
	alias ls='ls -pF'
else
	alias ls='ls --color=auto -pF'
fi

alias ll='ls -lh'
alias la='ls -lah'

# git commands
alias gs='git status'
alias gpl='git pull'
alias gp='git push'
alias gc='git commit'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gcl='git clone'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gb='git branch'
alias gck='git checkout'
alias gsh='git show'
alias gr='git rm'

# screen
alias sr='screen -r'

# set history size
HISTSIZE=50000
HISTFILESIZE=100000

# unified bash history, useful with multiple screen sessions
# courtesy of http://superuser.com/questions/37576/can-history-files-be-unified-in-bash

shopt -s histappend
PROMPT_COMMAND="history -a; history -n"

# set vi bindings for bash
set -o vi

# Re-attach to screen session if present
screenout=`screen -ls | head -1 | awk '{print $1}'`
screenatch=`screen -ls | head -2 | tail -1 | awk '{print $NF}'`
# If multiple screen sessions are running, attach to the first one in the list
screenname=`screen -ls | head -2 | tail -1 | awk '{print $1}' | awk -F. '{print $2}'`
if [ "$screenout" != "No" -a "$screenatch" != "(Attached)" ]; then
	screen -r $screenname
fi
