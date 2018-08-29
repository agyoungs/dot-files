#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# installation
cp $DIR/rgit /usr/local/bin/rgit

cat <<EOF > /usr/local/bin/displays_off
#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=`pgrep -a Xorg | grep -oP "(?<=-auth )[^ ]+"`
xset dpms force off
EOF
chmod 755 /usr/local/bin/displays_off

cat <<EOF > /usr/local/bin/displays_on
#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=`pgrep -a Xorg | grep -oP "(?<=-auth )[^ ]+"`
xset dpms force on
EOF
chmod 755 /usr/local/bin/displays_on

cp $DIR/99-local.rules /etc/udev/rules.d/
