#!/bin/bash
source /etc/profile

# add package keywords
cat <<DATAEOF >> "$chroot/etc/portage/package.accept_keywords/fabric"
dev-python/fabric ~x86 ~amd64
DATAEOF

# unmask fabric
mkdir -p "$chroot/etc/portage/package.unmask"
cat <<DATAEOF >> "$chroot/etc/portage/package.unmask/fabric"
dev-python/fabric
DATAEOF

# install fabric
chroot "$chroot" emerge dev-python/fabric

