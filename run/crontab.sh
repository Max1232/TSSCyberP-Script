#!/bin/bash

crontab -r
cd /etc/
/bin/rm -f cron.deny at.deny
echo root >cron.allow
echo root >at.allow
/bin/chown root:root cron.allow at.allow
/bin/chmod 644 cron.allow at.allow

sudo tree -d /home > ~/Desktop/scrptlog/user.txt
sudo tree /etc/cron.d >> ~/Desktop/scrptlog/cron.txt
sudo tree /etc/cron.hourly >> ~/Desktop/scrptlog/cron.txt
sudo tree /etc/cron.daily >> ~/Desktop/scrptlog/cron.txt
sudo tree /etc/cron.weekly >> ~/Desktop/scrptlog/cron.txt
sudo tree /etc/cron.monthly >> ~/Desktop/scrptlog/cron.txt

notify-send -i ~/Desktop/ScriptFolder/data/icon.png "Script Checkpoint" "Crontab logged"
