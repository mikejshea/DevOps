
#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "prodeng        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

apt-get install -y --no-install-recommends ubuntu-desktop
