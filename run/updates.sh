#!/bin/bash

sudo apt-get -y install --reinstall coreutils

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install -f
sudo apt-get -y install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades

sudo apt-get -y install nodejs
sudo apt-get -y install git
sudo apt-get -y install tree
sudo apt-get -y install cracklib
sudo apt-get -y install gksu wget
sudo apt-get -y install iptables
sudp apt-get -y install iptables-persistent
sudo apt-get -y install openssh-server
sudo apt-get -y install chkrootkit
sudo apt-get -y install clamav
sudo apt-get -y install clamtk
sudo apt-get -y install rkhunter
sudo apt-get -y install apparmor
sudo apt-get -y install apparmor-profiles
sudo apt-get -y install mhash
sudo apt-get -y install gksudo
sudo apt-get -y install wget
sudo apt-get -y install bum
sudo apt-get -y install zenity

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

notify-send -i ~/Desktop/ScriptFolder/data/icon.png "Script Checkpoint" "Updates complete"
