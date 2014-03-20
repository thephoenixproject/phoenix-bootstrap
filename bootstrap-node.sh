#!/bin/bash

set -eux

GIT_REPO="$1"
MASTER_IP="$2"
MASTER_HOSTNAME="$3"

# A real VM should already contain git and puppet 3
rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
yum -y install git puppet

# A real environment should also expose the phoenix master via dns
echo "$MASTER_IP $MASTER_HOSTNAME $MASTER_HOSTNAME.local" >> /etc/hosts
git clone "$GIT_REPO" /etc/puppet/data && cd /etc/puppet/data
puppet apply manifests/site.pp --modulepath modules
