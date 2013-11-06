#!/bin/bash
source /etc/profile

# install a display manager
chroot "$chroot" emerge x11-apps/xdm

# set xdm as a default process
chroot "$chroot" rc-update add xdm default
