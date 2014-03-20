#!/bin/bash
# Creates a yum repository and installs all requisite rpms

set -eux
yum -y install createrepo yum-downloadonly httpd

mkdir -p /var/yumrepo && chmod 755 /var/yumrepo
yum --downloadonly --downloaddir=/var/yumrepo -y install gaim || true
createrepo /var/yumrepo

echo "Alias /yumrepo /var/yumrepo" > /etc/httpd/conf.d/yumrepo.conf
service httpd restart
