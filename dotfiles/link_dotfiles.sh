#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# linking
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.tmux.conf ~/.tmux.conf

# resource
tmux source-file ~/.tmux.conf
