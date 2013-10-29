#!/bin/bash
source /etc/profile

# install usbutils (which includes 'lsusb') and libusb
chroot "$chroot" emerge sys-apps/usbutils

# add exfat support for some thumb drives
#chroot "$chroot" emerge sys-fs/fuse sys-fs/exfat-utils sys-fs/fuse-exfat
