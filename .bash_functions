#!/bin/bash

bash_prompt() {
  local NONE="\[\e[0m\]" K="\[\e[0;90m\]" R="\[\e[0;91m\]" \
        G="\[\e[0;92m\]" Y="\[\e[0;93m\]" B="\[\e[0;94m\]" \
        M="\[\e[0;95m\]" C="\[\e[0;96m\]" W="\[\e[0;97m\]"

  (( UID != 0 )) && local UC=$Y || local UC=$R

  PS1="$M\h$NONE[$UC\u$NONE] \w \$ "
  PS2="> "
  PS3="> "
  PS4="+ "
}
