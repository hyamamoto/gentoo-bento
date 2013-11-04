#!/bin/bash
source /etc/profile

// * by default. You can disable it in the cluster's:
// *     /etc/postgresql-9.2/postgresql.conf
// *
// * The PostgreSQL server, by default, will log events to:
// *     /var/lib/postgresql/9.2/data/postmaster.log
// *
// * You should use the '/etc/init.d/postgresql-9.2' script to run PostgreSQL
// * instead of 'pg_ctl'.

# install postgresql
chroot "$chroot" emerge dev-db/postgresql-base dev-db/postgresql-server

# and install JDBC? (jdbc-postgresql-9.2_p1002 is masked)
# chroot "$chroot" emerge dev-java/jdbc-postgresql

# Configuration for postgresql 9.2 data directory
# emerge --config dev-db/postgresql-server:9.2
# y

# Update postgresql.conf
chroot "$chroot" sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '\*'        /g" /etc/postgresql-9.2/postgresql.conf

# Update pg_hba.conf
cat <<DATAEOF >> "$chroot/etc/postgresql-9.2/pg_hba.conf"
host    all             all             33.33.33.0/24            trust
host    all             all             10.0.2.0/24              trust
DATAEOF

chroot "$chroot" rc-config add postgresql-9.2 default

