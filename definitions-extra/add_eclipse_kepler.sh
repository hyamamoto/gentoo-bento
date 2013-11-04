#!/bin/bash
source /etc/profile

# WARNING: This script needs an appropriate portage overlay configured on your system

cat <<DATAEOF >> "$chroot/etc/portage/package.accept_keywords/eclipse-sdk-bin"
=dev-util/eclipse-sdk-bin-4.3* ~x86 ~amd64
DATAEOF

cat <<DATAEOF >> "$chroot/etc/portage/package.unmask/eclipse-sdk-bin"
=dev-util/eclipse-sdk-bin-4.3*
DATAEOF

# use flags for gtk dependency
cat <<DATAEOF >> "$chroot/etc/portage/package.use/eclipse-sdk-bin"
media-libs/freetype X
media-fonts/dejavu X
x11-libs/cairo X
x11-libs/pango X
x11-libs/gdk-pixbuf X
DATAEOF

# install eclipse
chroot "$chroot" emerge x11-libs/libXtst =dev-util/eclipse-sdk-bin-4.3

