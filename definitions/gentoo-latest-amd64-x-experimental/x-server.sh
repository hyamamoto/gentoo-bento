#!/bin/bash
source /etc/profile

cat <<DATAEOF >> "$chroot/etc/portage/package.accept_keywords/xorg-server"
=x11-drivers/xf86-video-virtualbox-4.3.0 ~x86 ~amd64
DATAEOF

cat <<DATAEOF >> "$chroot/etc/portage/package.unmask/xorg-server"
>=x11-drivers/xf86-video-virtualbox-4.3.0
DATAEOF

# use flags for gtk dependency
cat <<DATAEOF >> "$chroot/etc/portage/package.use/xorg-server"
x11-base/xorg-server udev -minimal

media-libs/freetype X
media-fonts/dejavu X
x11-libs/cairo X
x11-libs/pango X
x11-libs/gdk-pixbuf X
DATAEOF

# install xorg-server
chroot "$chroot" /bin/bash <<DATAEOF
# Emerge about 20 packages with multithreading.
emerge x11-apps/xauth
# x11-drivers/xf86-video-virtualbox has to be compiled with a single cpu.
# See: http://forums.gentoo.org/viewtopic-p-7418604.html
MAKEOPTS="-j1" emerge x11-base/xorg-server
DATAEOF

#and needs /Driver "vboxvideo"/ in xorg.conf

# now you have a choise of display manager
#  http://wiki.gentoo.org/wiki/Display_manager
#  http://docs.huihoo.com/gentoo/resources/document-listing/xorg-config.html
#  http://wiki.gentoo.org/wiki/Xorg.conf
