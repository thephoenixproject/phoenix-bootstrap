#!/bin/bash
# Modules are always injected into a Phoenix node,
# and an initial puppet apply takes care of auto-updates
set -eux
git clone "${1}" /etc/puppet/data && cd /etc/puppet/data
puppet apply manifests/site.pp --modulepath modules
