#
# ~/.bashrc
#

[ -z "$PS1" ] && return

# Start tmux on every graphical shell login
if [ -n "${DISPLAY}" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "${TMUX}" ]; then
  exec tmux new -As $USER
fi

[[ -f /etc/bashrc ]] && . /etc/bashrc

[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

[[ -f ~/.bash_functions ]] && . ~/.bash_functions
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

[[ -r ~/.dircolors ]] && eval $(dircolors -b ~/.dircolors)

bash_prompt
