#!/bin/bash
source /etc/profile

// WARNING: Scala ebuild requires at least 1532 megabytes RAM.
//          Some version of scala ebuild ignores "binary" use flag
//          which means you always needs 1.5G RAM when introducing scala to the system.
//          This is a bug. You may manually comment out CHECKREQS_MEMORY line in the ebuild.

// WARNING: Scala has these packages with fetch-restriction.
//          Manually download and place them on /usr/portage/distfiles

// * Please download osgi.enterprise-5.0.0.jar from
// *   http://www.osgi.org/Download/Release5
// * which you can find listed as
// *   OSGi Enterprise Release 5 Companion Code
// * after accepting the license.
// URL: http://www.osgi.org/Download/File?url=/download/r5/osgi.enterprise-5.0.0.jar

// * Please download osgi.cmpn-4.3.1.jar from
// *   http://www.osgi.org/Download/Release4V43
// * which you can find listed as
// *   OSGi Service Platform Release 4 Version 4.3 Compendium Companion Code
// * after accepting the license.
// URL: http://www.osgi.org/Download/File?url=/download/r4v43/osgi.cmpn-4.3.1.jar

// * Please download osgi.core-5.0.0.jar from
// *   http://www.osgi.org/Download/Release5
// * which you can find listed as
// *   OSGi Core Release 5 Companion Code
// * after accepting the license.
// URL: http://www.osgi.org/Download/File?url=/download/r5/osgi.core-5.0.0.jar

cat <<DATAEOF > "$chroot/etc/portage/package.accept_keywords/scala"
=virtual/jdk-1.7.0 ~x86 ~amd64
dev-java/javatoolkit ~x86 ~amd64
=dev-java/ant-owanttask-1.3.2 ~x86 ~amd64
dev-java/osgi-enterprise-api ~x86 ~amd64
dev-java/bndlib ~x86 ~amd64
dev-java/osgi-foundation ~x86 ~amd64
dev-java/osgi-compendium ~x86 ~amd64
dev-java/libg ~x86 ~amd64
=virtual/jre-1.7.0 ~x86 ~amd64
=dev-java/hawtjni-runtime-1.8 ~x86 ~amd64
dev-lang/scala ~x86 ~amd64
DATAEOF

cat <<DATAEOF >> "$chroot/etc/portage/package.use/scala"
dev-lang/scala binary
DATAEOF

cat <<DATAEOF >> "$chroot/etc/portage/package.unmask/scala"
=dev-java/javatoolkit-0.3.0-r9
=dev-lang/scala-2.10*
DATAEOF

# install scala
chroot "$chroot" emerge dev-lang/scala
