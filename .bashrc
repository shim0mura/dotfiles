# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

# use Node.js version 0.6.6
if [ -e ~/work/node.js/.nvm/nvm.sh ]
  then
    . ~/work/node.js/.nvm/nvm.sh
    nvm use "v0.6.6"
fi

export HISTSIZE=300000
export JSTESTDRIVER_HOME=~/jstest

alias la="ls -la"
alias ll="ls -lh"
