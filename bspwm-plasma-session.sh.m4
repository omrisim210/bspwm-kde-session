#!/bin/sh
#
# Start a KDE Plasma session with the bspwm tiling window manager
#

export KDEWM='BSPWM'

exec startkde "$@"
