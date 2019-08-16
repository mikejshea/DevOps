#!/bin/sh -x
yum install -y epel-release
yum install -y open-vm-tools
systemctl start vmtoolsd.service
systemctl enable vmtoolsd.service
vmware-toolbox-cmd timesync enable

setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
