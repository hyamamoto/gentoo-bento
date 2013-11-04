#!/bin/bash
source /etc/profile

# add package keywords (docker has no support for x86 though)
cat <<DATAEOF >> "$chroot/etc/portage/package.accept_keywords/docker"
sys-fs/aufs3 ~x86 ~amd64
sys-fs/aufs-headers ~x86 ~amd64
sys-kernel/aufs-sources ~x86 ~amd64
sys-fs/aufs-util ~x86 ~amd64
app-emulation/docker ~x86 ~amd64
DATAEOF

# unmask docker
mkdir -p "$chroot/etc/portage/package.unmask"
cat <<DATAEOF >> "$chroot/etc/portage/package.unmask/docker"
sys-fs/aufs3
sys-fs/aufs-headers
sys-kernel/aufs-sources
sys-fs/aufs-util
app-emulation/docker
DATAEOF

# install docker
chroot "$chroot" emerge app-emulation/docker

