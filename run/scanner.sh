#!/bin/bash

mkdir ~/Desktop/lynis
cd ~/Desktop/lynis
git clone https://github.com/CISOfy/lynis
cd lynis
sudo ./lynis audit system

sudo apt-get install zenity
echo you may want to run zenity

sudo chkrootkit > ~/Desktop/scrptlog/chkrootkit.txt
sudo clamscan -r -l > ~/Desktop/scrptlog/clamav.txt
sudo rkhunter -sk --checkall -l  > ~/Desktop/scrptlog/rkhunter.txt

notify-send -i ~/Desktop/ScriptFolder/data/icon.png "Script Checkpoint" "Scanners run and logged"
