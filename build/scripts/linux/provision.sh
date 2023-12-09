#!/usr/bin/env bash

echo "Provisioning phase 1 - Starting: Mirror and basic packages"
export DEBIAN_FRONTEND=noninteractive
apt-get clean all -y
apt-get update -y
apt-get install pv perl mc net-tools -y

# set locale
sudo update-locale LANG=en_US.UTF-8

echo "Provisioning phase 1 - system updates"
export DEBIAN_FRONTEND=noninteractive
apt-get -y -q upgrade
apt-get -y -q clean all

echo "Provisioning phase 1 - all done"

echo "Provisioning phase 2 - Cleaning up"

## Clean logs
truncate -s 0 /var/log/*.*
truncate -s 0 /var/log/**/*.*
find /var/log -type f -name '*.[0-99].gz' -exec rm {} +
echo "creationDate: $(date +%Y-%m-%d_%H:%M)"
echo "Provisioning phase 2 - Done"
echo "Provisioning done - all phases"