# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
export HISTSIZE=300000
export JSTESTDRIVER_HOME=~/jstest

alias la="ls -a"
alias ll="ls -l"
