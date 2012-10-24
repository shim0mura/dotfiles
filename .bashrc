# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

# use Node.js version 0.6.6
if [ -e ~/.nvm/nvm.sh ]
  then
    . ~/.nvm/nvm.sh
    nvm use "v0.6.15" > /dev/null 2>&1
fi

# use rvm
#source $HOME/.rvm/scripts/rvm
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export HISTSIZE=300000
export JSTESTDRIVER_HOME=~/jstest

alias la="ls -la"
alias ll="ls -lh"
