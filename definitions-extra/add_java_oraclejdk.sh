#!/bin/bash
source /etc/profile

// * Oracle requires you to download the needed files manually after
// * accepting their license through a javascript capable web browser.
// *
// * Download the following files:
// *   jdk-7u45-linux-i586.tar.gz
// * at 'http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html'
// * and move them to '/usr/portage/distfiles'

cat <<DATAEOF >> "$chroot/etc/portage/package.unmask/oracle-jdk-bin"
>=dev-java/oracle-jdk-bin-1.7.0.45
DATAEOF

# license
cat <<DATAEOF >> "$chroot/etc/portage/package.license/oracle-jdk-bin"
# required by dev-java/oracle-jdk-bin (argument)
>=dev-java/oracle-jdk-bin-1.7.0.45 Oracle-BCLA-JavaSE
DATAEOF

# remove X dependency.
cat <<DATAEOF >> "$chroot/etc/portage/package.use/oracle-jdk-bin"
media-libs/giflib -X
#media-libs/libjpeg-turbo -java
dev-java/icedtea-bin -X -alsa cjk -cups -nsplugin
dev-java/oracle-jdk-bin -X -alsa fontconfig -jce
DATAEOF

# install jdk
chroot "$chroot" emerge dev-java/oracle-jdk-bin
