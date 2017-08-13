#!/bin/bash

# Pull secret varibles in
if [ -f ~/.dotfiles_secrets ]; then
  . ~/.dotfiles_secrets
fi

# Some aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Enable rbenv if it exists
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Enable pyenv if it exists
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Use user bin path
export PATH=$PATH:~/bin

# Set GOPATH
export GOPATH=$HOME/Documents/Personal/Development/go
export PATH=$PATH:$GOPATH/bin

# Set up terminal PushOver notifications function
function pushover {
  curl -s -F "token=$PUSHOVER_TOKEN" \
  -F "user=$PUSHOVER_USER" \
  -F "title=Console" \
  -F "message=$1" https://api.pushover.net/1/messages.json
}

# Homebrew Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Enable sbin for Homebrew apps
export PATH="/usr/local/sbin:$PATH"

# ARM devkit toolchain
if [ -d /opt/devkitPro ]; then
  export DEVKITPRO=/opt/devkitPro
  export DEVKITARM=$DEVKITPRO/devkitARM
  export PATH=$PATH:$DEVKITARM/bin
fi

# Vagrant default provider
VAGRANT_DEFAULT_PROVIDER="virtualbox"
#VAGRANT_DEFAULT_PROVIDER="vmware_fusion"
