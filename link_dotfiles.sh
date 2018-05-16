#!/usr/bin/env bash

# linking
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# resource
tmux source-file ~/.tmux.conf
