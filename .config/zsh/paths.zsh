#!/usr/bin/env zsh

export DOOM_PATH=$HOME/.config/emacs/bin
export GOPATH=$HOME/.go
export X=/Users/martin/Downloads/ripgrep-13.0.0-x86_64-apple-darwin

PATH=/opt/homebrew/bin:$PATH
PATH=$DOOM_PATH:$GOPATH/bin:$X:$PATH

export USERLED_HOME=$HOME/Documents/core
export GOPATH=$HOME/.go # points to any directories which contain Go code

PATH=/usr/local/go/bin:$GOPATH/bin:$PATH

# Grep
PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

# PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
