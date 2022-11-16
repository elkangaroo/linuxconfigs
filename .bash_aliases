#!/bin/bash

alias ls="ls -F --color=auto"
alias la="ls -Ash"
alias ll="ls -Alh --time-style long-iso"
alias grep="grep --color=auto"
alias ifconfig="ip addr"

if [ -x "$(command -v nvim)" ]; then
  alias vim="nvim"
  alias vimdiff="nvim -d"
fi
