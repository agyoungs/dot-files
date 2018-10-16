#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp $DIR/.tmux.conf.tmp $DIR/.tmux.conf

# Assume the appropriate tmux version
CODENAME=`lsb_release -sc`
if [ "$CODENAME" = "trusty" ] || [ "$CODENAME" = "rosa" ] || [ "$CODENAME" = "rafaela" ] || [ "$CODENAME" = "rebecca" ] || [ "$CODENAME" = "qiana" ] ; then
  echo "set -g mode-mouse on" >> $DIR/.tmux.conf
elif [ "$CODENAME" = "xenial" ] || [ "$CODENAME" = "sylvia" ] || [ "$CODENAME" = "sonya" ] || [ "$CODENAME" = "serena" ] || [ "$CODENAME" = "sarah" ] ; then
  echo "set -g mouse on" >> $DIR/.tmux.conf
fi

# linking
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.tmux.conf ~/.tmux.conf

# re-source
tmux source-file ~/.tmux.conf
