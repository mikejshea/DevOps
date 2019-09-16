cd /data
cp "/media/$USER/VMware Tools/"VMwareTools-*.tar.gz /data/vmwaretools.tar.gz
tar xvzf /data/vmwaretools.tar.gz
sudo /data/vmware-tools-distrib/vmware-install.pl -f -d

wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo add-apt-repository universe
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2=2.2.100-1

sudo apt install -y python-pip python3-pip

sudo snap install postman
sudo snap install atom --classic
sudo snap install code --classic
sudo snap install rider --classic
sudo snap install pycharm-professional --classic
sudo snap install gnome-system-monitor

# gsettings get org.gnome.shell favorite-apps
gsettings set org.gnome.shell favorite-apps "['ubiquity.desktop', 'firefox.desktop', 'terminator.desktop', 'atom_atom.desktop', 'code_code.desktop', 'rider_rider.desktop', 'pycharm-professional_pycharm-professional.desktop', 'org.gnome.Nautilus.desktop', 'postman_postman.desktop']"

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker $USER

#sudo ./vmware-install.pl -f -d
#docker run --name reviews -v /dbs:/var/lib/postgresql/data -d postgres:tag
#docker run --name reviews -v /dbs:/var/lib/postgresql/data -d postgres:tag
