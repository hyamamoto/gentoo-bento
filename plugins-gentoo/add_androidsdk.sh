#!/bin/bash
source /etc/profile

cat <<DATAEOF >> "$chroot/etc/portage/package.accept_keywords/android"
dev-util/android-tools  ~x86 ~amd64
dev-util/android-sdk-update-manager ~x86 ~amd64
dev-util/android-ndk ~x86 ~amd64
DATAEOF

cat <<DATAEOF >> "$chroot/etc/portage/package.use/android"
dev-java/swt cairo
DATAEOF

# install 
chroot "$chroot" emerge dev-util/android-tools  dev-util/android-sdk-update-manager
 
chroot "$chroot" env-update;source /etc/profile
chroot "$chroot" gpasswd -a vagrant android


// * The Android SDK now uses its own manager for the development environment.
// * Run 'android' to download the full SDK, including some of the platform tools.
// * If you have problems downloading the SDK, see http://code.google.com/p/android/issues/detail?id=4406

