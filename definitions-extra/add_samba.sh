#!/bin/bash
source /etc/profile

mkdir -p "$chroot/etc/portage/package.use"
cat <<DATAEOF >> "$chroot/etc/portage/package.use/samba"
sys-libs/tdb python
sys-libs/talloc python
DATAEOF

# install samba
chroot "$chroot" emerge samba

