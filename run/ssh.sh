#!/bin/bash

sudo apt-get -y install openssh-server

sudo sed -i '/^PermitRootLogin/ c\PermitRootLogin no' /etc/ssh/sshd_config
sudo sed -i '/^Protocol/ c\Protocol 2' /etc/ssh/sshd_config
sudo sed -i '/^IgnoreRhosts/ c\IgnoreRhosts yes' /etc/ssh/sshd_config
sudo sed -i '/^HostbasedAuthentication/ c\HostbasedAuthentication no' /etc/ssh/sshd_config
sudo sed -i '/^Banner/ c\Banner   /etc/issue' /etc/ssh/sshd_config
sudo sed -i '/^PermitEmptyPasswords/ c\PermitEmptyPasswords no' /etc/ssh/sshd_config
sudo sed -i '/^LogLevel/ c\LogLevel INFO' /etc/ssh/sshd_config
sudo sed -i '/^UsePrivilegeSeparation/ c\UsePrivilegeSeparation yes' /etc/ssh/sshd_config
sudo sed -i '/^StrictModes/ c\StrictModes yes' /etc/ssh/sshd_config
sudo sed -i '/^VerifyReverseMapping/ c\VerifyReverseMapping yes' /etc/ssh/sshd_config
sudo sed -i '/^AllowTcpForwarding/ c\AllowTcpForwarding no' /etc/ssh/sshd_config
sudo sed -i '/^X11Forwarding/ c\X11Forwarding no' /etc/ssh/sshd_config

sudo service ssh restart

notify-send -i ~/Desktop/ScriptFolder/data/icon.png "Script Checkpoint" "SSH configured"
