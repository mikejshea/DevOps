
#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "prodeng        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers


apt-get update
apt-get install -y ubuntu-desktop
apt-get install -y terminator git
locale-gen --purge

export VGMOUNT=$(echo "$VOLGROUP" | sed -r 's/-/--/g')

pvcreate /dev/sdb
vgextend $VOLGROUP /dev/sdb
lvcreate -L 10G -n data $VOLGROUP
mkfs.ext4 /dev/$VOLGROUP/data
mkdir /data
mount /dev/$VOLGROUP/data /data
chmod -R 0777 /data
echo "/dev/mapper/$VGMOUNT-data /data           ext4    errors=remount-ro 0       1" >> /etc/fstab


apt-add-repository --yes --update ppa:ansible/ansible
apt-get update
apt-get install -y software-properties-common
apt-get install -y ansible

lvcreate -L 5G -n postgres $VOLGROUP
mkfs.ext4 /dev/$VOLGROUP/postgres
mkdir -p /dbs/postgres
mount /dev/$VOLGROUP/postgres /dbs/postgres
chmod -R 0777 /dbs/postgres
echo "/dev/mapper/$VGMOUNT-postgres /dbs/postgres         ext4    errors=remount-ro 0       1" >> /etc/fstab

lvcreate -L 5G -n elastic $VOLGROUP
mkfs.ext4 /dev/$VOLGROUP/elastic
mkdir -p /dbs/elastic
mount /dev/$VOLGROUP/elastic /dbs/elastic
chmod -R 0777 /dbs/elastic
echo "/dev/mapper/$VGMOUNT-elastic /dbs/elastic         ext4    errors=remount-ro 0       1" >> /etc/fstab
