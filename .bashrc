#
# ~/.bashrc
#

[ -z "$PS1" ] && return

[[ -f ~/.bash_functions ]] && . ~/.bash_functions
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

[[ -r ~/.dircolors ]] && eval $(dircolors -b ~/.dircolors)

bash_prompt
