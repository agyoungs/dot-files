#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d "$DIR/tmux-resurrect" ]; then
  git clone https://github.com/tmux-plugins/tmux-resurrect $DIR/tmux-resurrect
else
  cd $DIR/tmux-resurrect
  git pull
  cd $DIR
fi

sed -i '/# Custom Settings (ayoungs)/Q' ~/.bashrc
cat <<EOT >> ~/.bashrc
# Custom Settings (ayoungs)
export ROSDISTRO_INDEX_URL=https://ivs-git.dyn.datasys.swri.edu/external/rosdistro/raw/swri/index.yaml

export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH="\${LD_LIBRARY_PATH}:\${CUDA_HOME}/lib64"
PATH=\${CUDA_HOME}/bin:\${PATH}
export PATH

tmux_session=\`tmux display-message -p "#S" 2> /dev/null\` 
if [ -f ~/workspaces/\$tmux_session/devel/setup.bash ]; then
  . ~/workspaces/\$tmux_session/devel/setup.bash
fi

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Sets history to append mode
shopt -s histappend
# Writes to history every time command prompt is returned
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# This grabs the last ROS_MASTER_URI exported
# Todo: fix this to use a function
test=\`grep '^export ROS_MASTER_URI=' \$HISTFILE | tail -1\`
eval \$test
EOT

touch ~/.bash_eternal_history
./dotfiles/link_dotfiles.sh
sudo $DIR/scripts/install_scripts.sh
