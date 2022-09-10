#!/bin/bash

DIR="$(dirname "$(realpath "$0")")"
ln -s $DIR/.config/zsh ~/.config/zsh
ln -s $DIR/.zshenv ~/.zshenv

source $HOME/.config/zsh/plugins/install_plugins.sh
