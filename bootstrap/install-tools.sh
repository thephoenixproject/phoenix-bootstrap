#!/bin/bash
# Installs the low-level box dependencies
# We expect these to be provided within a Real Environment (tm)
set -eux
rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
yum -y install puppet git && yum -y update
