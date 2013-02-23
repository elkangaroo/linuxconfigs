[ -z "$PS1" ] && return

alias ls="ls --color=auto"
alias ll="ls -hal"
alias ifconfig="ip addr"

export EDITOR="vim"
export PATH="$PATH:~/bin:."

PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

