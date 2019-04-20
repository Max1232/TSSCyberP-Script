#!/bin/bash

sudo apt-get -y install vsftpd

sudo sed -i '/^anon_upload_enable/ c\anon_upload_enable no' /etc/vsftpd.conf
sudo sed -i '/^anonymous_enable/ c\anonymous_enable=NO' /etc/vsftpd.conf
sudo sed -i '/^chroot_local_user/ c\chroot_local_user=YES' /etc/vsftpd.conf

sudo service vsftpd restart

notify-send -i ~/Desktop/ScriptFolder/data/icon.png "Script Checkpoint" "Vsftpd configured"
