#!/usr/bin/env zsh

export DOOM_PATH=$HOME/.emacs.d/bin
export GOPATH=$HOME/.go
export USERLED

PATH=/opt/homebrew/bin:$PATH
PATH=$DOOM_PATH:$GOPATH/bin:$PATH

export USERLED_HOME=$HOME/Documents/core
export GOPATH=$HOME/.go # points to any directories which contain Go code

PATH=/Users/martin/.cargo/bin:$PATH
PATH=/usr/local/go/bin:$GOPATH/bin:$PATH
