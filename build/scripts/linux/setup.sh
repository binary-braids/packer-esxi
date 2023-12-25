#!/usr/bin/env bash

echo '> Cleaning all audit logs ...'
if [ -f /var/log/audit/audit.log ]; then
cat /dev/null > /var/log/audit/audit.log
fi
if [ -f /var/log/wtmp ]; then
cat /dev/null > /var/log/wtmp
fi
if [ -f /var/log/lastlog ]; then
cat /dev/null > /var/log/lastlog
fi

# Cleans SSH keys.
echo '> Cleaning SSH keys ...'
rm -f /etc/ssh/ssh_host_*

# Sets hostname to localhost.
echo '> Setting hostname to localhost ...'
cat /dev/null > /etc/hostname
hostnamectl set-hostname localhost

# Cleans apt-get.
echo '> Cleaning apt-get ...'
apt-get clean

# Cleans the machine-id.
echo '> Cleaning the machine-id ...'
truncate -s 0 /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

# Clean cloud-init data
echo '> Cleaning cloud-init data ...'
rm -rf /var/lib/cloud/*
ln -s /var/lib/cloud/instances /var/lib/cloud/instance
rm -rf /var/log/cloud-init*
cloud-init clean

echo '> Reconfigure cloud-init ...'
echo 'datasource_list: [ "VMware" ]' > /etc/cloud/cloud.cfg.d/00-ovf-data.cfg