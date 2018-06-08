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

tmux_session=\`tmux display-message -p "#S"\` 
if [ -d ~/workspaces/\$tmux_session ]; then
  . ~/workspaces/\$tmux_session/devel/setup.bash
fi
EOT

sudo $DIR/scripts/install_scripts.sh
