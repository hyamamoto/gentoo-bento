#!/bin/bash
source /etc/profile

# See: http://wiki.gentoo.org/wiki/Layman

cat <<DATAEOF >> "$chroot/etc/portage/package.use/layman"
app-portage/layman git
DATAEOF

# install layman
chroot "$chroot" emerge app-portage/layman
chroot "$chroot" echo "source \"/var/lib/layman/make.conf\"" >> /etc/portage/make.conf

# update a remote overlay list
#chroot "$chroot" layman --sync-all

# clear a cached overlay list
#chroot "$chroot" rm -rf /var/lib/layman/cache*.timestamp
#chroot "$chroot" rm -rf /var/lib/layman/cache*.xml
