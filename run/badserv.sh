#!/bin/bash

sudo apt-get -y purge dnsmasq-base
sudo apt-get -y purge john
sudo apt-get -y purge medusa
sudo apt-get -y purge hydra
sudo apt-get -y purge ophcrack
sudo apt-get -y purge remmina
sudo apt-get -y purge minetest
sudo apt-get -y purge qbittorrent
sudo apt-get -y purge utorrent
sudo apt-get -y purge ctorrent
sudo apt-get -y purge ktorrent
sudo apt-get -y purge rtorrent
sudo apt-get -y purge freeciv
sudo apt-get -y purge deluge
sudo apt-get -y purge transmission-gtk
sudo apt-get -y purge transmission-common
sudo apt-get -y purge tixati
sudo apt-get -y purge frostwise
sudo apt-get -y purge vuze
sudo apt-get -y purge irssi
sudo apt-get -y purge talk
sudo apt-get -y purge wireshark
sudo apt-get -y purge nmap
sudo apt-get -y purge netcat
sudo apt-get -y purge netcat-openbsd
sudo apt-get -y purge netcat-traditional
sudo apt-get -y purge netcat-ubuntu
sudo apt-get -y purge netcat-minimal
sudo apt-get -y autoremove

notify-send -i ~/Desktop/ScriptFolder/data/icon.png "Script Checkpoint" "Bad services removed"
