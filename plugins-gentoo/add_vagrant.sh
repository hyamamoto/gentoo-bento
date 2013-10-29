#!/bin/bash
source /etc/profile

# add package keywords
cat <<DATAEOF >> "$chroot/etc/portage/package.accept_keywords/vagrant"
app-emulation/vagrant ~x86 ~amd64
DATAEOF

# unmask docker
mkdir -p "$chroot/etc/portage/package.unmask"
cat <<DATAEOF >> "$chroot/etc/portage/package.unmask/vagrant"
app-emulation/vagrant
DATAEOF

# install vagrant
chroot "$chroot" emerge app-emulation/vagrant

