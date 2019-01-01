#!/bin/bash

set -e

set -x
vagrant up
set +x

# show me the ip addresses
echo
echo "Login with 'admin:admin' on Jenkins master port 8080"
echo -n "Jenkins master IP address(es): "
vagrant ssh master -c 'hostname -i' 2>/dev/null
echo
echo -n "Jenkins slave IP address(es): "
vagrant ssh slave1 -c 'hostname -i' 2>/dev/null
