#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# installation
cp $DIR/rgit /usr/local/bin/rgit
cp $DIR/tmux-session /usr/local/bin/tmux-session

# add cronjobs
sudo $DIR/crontab.sh
