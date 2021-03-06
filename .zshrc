# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"  ]]; then
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR=vim
export VISUAL=vim

alias ssh="TERM=xterm ssh"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"

# Git
alias gst="clear;gwS"
alias ga="gia"
alias gtday="g log --since=\"12am\" | ack Date: | wc -l"

# rbenv
eval "$(rbenv init - zsh)"

# virtualenvwrapper
export WORKON_HOME=~/venvs
source /usr/local/bin/virtualenvwrapper.sh
unset VIRTUAL_ENV_DISABLE_PROMPT
