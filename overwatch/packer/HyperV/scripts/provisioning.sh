#!/bin/sh -x
yum install -y epel-release

setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

yum install -y python-pip wget git
yum install -y ansible

sudo mkdir -p /data/devops
sudo chown -R devops:devops /data

echo "sudo /usr/bin/vmhgfs-fuse .host:/devops /data/devops -o subtype=vmhgfs-fuse,allow_other" >> /home/devops/shared_folder.sh
chmod +x /home/devops/shared_folder.sh
