#!/bin/sh -x
yum install -y epel-release
yum install -y open-vm-tools
systemctl start vmtoolsd.service
systemctl enable vmtoolsd.service
vmware-toolbox-cmd timesync enable

setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

yum install -y python-pip wget git
yum install -y ansible

sudo mkdir -p /data/devops
sudo chown -R overwatch:overwatch /data

echo "sudo /usr/bin/vmhgfs-fuse .host:/overwatch /data/devops -o subtype=vmhgfs-fuse,allow_other" >> /home/overwatch/shared_folder.sh
chmod +x /home/overwatch/shared_folder.sh
