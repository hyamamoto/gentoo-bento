#!/bin/bash
source /etc/profile

cat <<DATAEOF >> "$chroot/etc/portage/package.accept_keywords/icedtea-bin"
dev-java/icedtea-bin ~x86 ~amd64
DATAEOF

cat <<DATAEOF >> "$chroot/etc/portage/package.unmask/icedtea-bin"
=dev-java/icedtea-bin-7*
DATAEOF

cat <<DATAEOF >> "$chroot/etc/portage/package.use/icedtea-bin"
# without X support
media-libs/giflib -X
dev-java/icedtea-bin -X -cups cjk

# with X support
#media-libs/giflib X
#dev-java/icedtea-bin X cups cjk
#app-text/ghostscript-gpl cups
DATAEOF

# install jdk
chroot "$chroot" emerge dev-java/icedtea-bin

# switch system jdk from 1.6 to 1.7
chroot "$chroot" eselect java-vm set system icedtea-bin-7

