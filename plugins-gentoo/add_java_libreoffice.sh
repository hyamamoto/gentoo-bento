#!/bin/bash
source /etc/profile

#WARNING: Compiling LO requires 512Mb memory and 6GB disk space

cat <<DATAEOF >> "$chroot/etc/portage/package.use/libreoffice"
app-office/libreoffice -cups -gtk -webdav
dev-libs/libxml2 python
DATAEOF

# compile and install libreoffice
chroot "$chroot" emerge -av app-office/libreoffice


