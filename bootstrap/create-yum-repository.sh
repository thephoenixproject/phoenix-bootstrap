#!/bin/bash -e -x
# Creates a yum repository and installs all requisite rpms

yum -y install createrepo yum-downloadonly httpd

mkdir -p /var/yumrepo && chmod 0755 /var/yumrepo
yum --downloadonly --downloaddir=/var/yumrepo -y install gaim
createrepo /var/yumrepo

echo "Alias /yumrepo /var/yumrepo" >> /etc/httpd/conf.d/yumrepo.conf
service httpd restart
