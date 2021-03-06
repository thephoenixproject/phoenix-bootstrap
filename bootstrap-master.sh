#!/bin/bash
# Creates a yum repository, and seeds it with all rpms
# required for proper node execution. This means a node can
# be created without an internet connection.

set -eux

RPMS_TO_DOWNLOAD=""
YUMREPO_PATH="/var/yumrepo"

yum -y install createrepo httpd yum-downloadonly wget

wget -O /etc/yum.repos.d/sonar.repo http://downloads.sourceforge.net/project/sonar-pkg/rpm/sonar.repo
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key || true

mkdir -p "$YUMREPO_PATH" && chmod 755 /var/yumrepo
yum --downloadonly --downloaddir="$YUMREPO_PATH" -y install $RPMS_TO_DOWNLOAD || true
createrepo "$YUMREPO_PATH"

echo "Alias /rpms $YUMREPO_PATH" > /etc/httpd/conf.d/yumrepo.conf
chkconfig --level 345 httpd on && service httpd restart
