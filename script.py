#!usr/bin/env python2.7

import os
import subprocess
import sys
import commands
import shutil
import importlib
import time
import os.path

#This is the most up to date script (20/01/19)
#Created by Max, member of the TSS CyberPatriots team

root = raw_input("\nRoot's username: ")

passwd = raw_input("\nRoot's password: ")

os.system("mkdir ~/Desktop/scrptlog")
#This isn't really needed, but yeah anyway
print("\nUsername: " + root + "\nPassword: " + passwd)
os.system("echo Username: " + root + " > ~/Desktop/user.txt")
os.system("echo Password: " + passwd + " >> ~/Desktop/user.txt")
yes = True
no = False

#Defining a question statement
def prompt(answer):
	yes = set(['yes','y', 'ye', ''])
	no = set(['no','n'])
	while True:
		choice = (raw_input("\nWould you like to " + answer + "? (y/n)\n")).lower()
		if choice in yes:
			return True
		elif choice in no:
			return False
		else:
			print("Please respond with 'yes' or 'no'\n")

#asks to stop the script, just for precaution and checking stuff
def stop():
	if prompt("stop the script"):
		print("Script exiting...\n")
		exit()
	else:
		print("\nScript continuing...")

time.sleep(2)

#Show's the $Path, this is to make sure nothing nasty has been added to the startup file
print("\nPath:")
os.system("echo $PATH")
stop()

#This a little OCD thing that does absolutely nothing
def nextq():
	print ("\nNext Question... ")

#Opens text file
def view_file(filename):
	os.system("nano " + filename)

#Attempts to wipe out a service
def servicerem():
	os.system("sudo systemctl " + servicedel + " stop")
	os.system("sudo apt-get purge -y " + servicedel)
	os.system("sudo apt-get autoclean -y " + servicedel)
	os.system("sudo apt-get autoremove -y " + servicedel)

if prompt("run the updates script"):
	os.system("bash run/updates.sh")

#Adds aliases, not neccesary but they're there
os.system("more ~/Desktop/ScriptFolder/data/alias.txt >> ~/.bashrc; source ~/.bashrc")

print("Not sure whether or not sysctl.conf is in /etc/sysctl.conf or in /etc/sysctl/sysctl.conf\nAnswer yes if it's in /etc and no if it's in /etc/sysctl")
if prompt("move data/sysctl.conf to /etc/"):
	os.system("sudo cp data/sysctl.conf /etc/sysctl.conf")
	print("Moved sysctl")
else:
	if prompt("move data/systcl.conf to /etc/sysctl/"):
		os.system("sudo cp data/sysctl.conf /etc/sysctl/sysctl.conf")
		print("Moved sysctl")

nextq()
if prompt("run sysctl script"):
	os.system("bash run/sysctl.sh")

#Media files
print("Searching for media files, this may take some time")
os.system("echo -e \"\nmp3 files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find / -name '*.mp3' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\nmov files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find / -name '*.mov' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\nmp4 files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find / -name '*.mp4' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\navi files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find / -name '*.avi' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\nmpg files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find / -name '*.mpeg' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\nflac files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find / -name '*.flac' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\nm4a files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find / -name '*.m4a' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\nflv files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find / -name '*.flv' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\nogg files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find / -name '*.ogg' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\ngif files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find /home -name '*.gif' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\npng files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find /home -name '*.png' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\njpg files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find /home -name '*.jpg' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("echo -e \"\njpeg files:\" >> ~/Desktop/scrptlog/prohibitedfiles.txt; find /home -name '*.jpeg' >> ~/Desktop/scrptlog/prohibitedfiles.txt")
os.system("find / -name '*.txt' > ~/Desktop/scrptlog/textfiles.txt")

#Double checks you have answered the forensic questions
print("\nJust double checking, but have you answered the forensic questions?")
stop()

#Checks if you have run the script as super usr (sudo) to save issues
print("\nHave you run this script as super user?")
stop()

nextq()

if prompt("remove bad services"):
	os.system("bash run/badserv.sh")

nextq()

#Asks to install ufw (firewall)
if prompt("install ufw"):
	os.system("sudo apt-get -y install ufw")
	os.system("sudo apt-get -y install gufw")
	if prompt("configure ufw ports"):
		os.system("sudo ufw allow 80/tcp; sudo ufw allow out 443")
		os.system("sudo ufw logging high")
		os.system("sudo ufw deny 23; sudo ufw deny 2049; sudo ufw deny 515; sudo ufw deny 111; sudo ufw deny 7100")

firewall = False
#Asks to enable firewall
if prompt ("enable the firewall"):
	try:
		os.system("ufw enable")
		firewall = True
	except:
		firewall = False

if firewall == True:
	print("Firewall enabled...")
else:
	print("Firewall was not enabled...")

nextq()

if prompt("inspect network"):
	os.system("echo -e \"lsof Results:\" > ~/Desktop/scrptlog/ports.txt; sudo lsof -i -n -P >> ~/Desktop/scrptlog/ports.txt")
	os.system("echo -e \"\n \nNetstat Results:\" > ~/Desktop/scrptlog/ports.txt; sudo netstat -tulpn >> ~/Desktop/scrptlog/ports.txt")
	os.system("sudo service --status-all >> ~/Desktop/scrptlog/services_running.txt")
nextq()

#Lists all local users (in /etc/passwd)
if prompt ("list all local users"):
	os.system("cut -d: -f1 /etc/passwd")

nextq()

if prompt("list installed packages"):
	print("\nListing installed packages:")
	os.system("apt list --installed")

nextq()

#List running services (known unwanted ones)
if prompt("list known unwanted running services"):
	os.system("service --status-all | grep telnet")
	if prompt("remove telnet"):
		servicedel = "telnet"
		servicerem()
	print("You'll have to remove these manually if they are active:")
	os.system("service --status-all | grep samba")
	os.system("service --status-all | grep apache")
	os.system("service --status-all | grep postfix")

nextq()

if prompt("disable guest login"):
	os.system(
	"echo \"[SeatDefaults]\" > /etc/lightdm/lightdm.conf\
	echo \"allow-guest=false\" >> /etc/lightdm/lightdm.conf\
	echo \"greeter-hide-users = true\" >> /etc/lightdm/lightdm.conf\
	echo \"greeter-show-manual-login = true\" >> /etc/lightdm/lightdm.conf\
	echo \"autologin-user=none\" >> /etc/lightdm/lightdm.conf")

#Checks firewall status if enabled earlier
if firewall == True:
	if prompt("check firewall status"):
		os.system("ufw status")

#rc.local fix
os.system("echo \"exit 0\" > /etc/rc.local")

#Root user lock, if this doesn't get points, unlock it.
os.system("sudo passwd -l root")

nextq()

if prompt("Disable mounting of unwanted filesystems"):
	if prompt("Disable cramfs mounting"):
		os.system("echo \"install cramfs /bin/true\" >> /etc/modprobe.d/CIS.conf; rmmod cramfs")
	if prompt("Disable freevxfs mounting"):
		os.system("echo \"install freevxfs /bin/true\" >> /etc/modprobe.d/CIS.conf; rmmod freevxfs")
	if prompt("Disable jffs2 mounting"):
		os.system("echo \"install jffs2 /bin/true\" >> /etc/modprobe.d/CIS.conf; rmmod jffs2")
	if prompt("Disable hfs mounting"):
		os.system("echo \"install hfs /bin/true\" >> /etc/modprobe.d/CIS.conf; rmmod hfs")
	if prompt("Disable hfsplus mounting"):
		os.system("echo \"install hfsplus /bin/true\" >> /etc/modprobe.d/CIS.conf; rmmod hfsplus")
	if prompt("Disable udf mounting"):
		os.system("echo \"install udf /bin/true\" >> /etc/modprobe.d/CIS.conf; rmmod udf")

nextq()

#Required or unrequired services
if prompt("install/configure or remove ftp"):
	os.system("bash run/ftp.sh")
else:
	servicedel = "vsftp"
	servicerem()

nextq()

if prompt("install/configure or remove ssh"):
	os.system("bash run/ssh.sh")
else:
	servicedel = "openssh-server*"
	servicerem()

nextq()

if prompt("run crontab search"):
	os.system("bash run/crontab.sh")

nextq()

if prompt("run password policies fix"):
	os.system("run/passpol.sh")

nextq()

if prompt("run and install the scanners"):
	os.system("bash run/scanner.sh")

nextq()

if prompt("Install and configure ip tables"):
	os.system("bash run/iptables.sh")

nextq()

#Fixes firefox config, provided by paulkali
if prompt("run firefox config.js"):
	os.system("cp run/user.js ~/.mozilla/firefox/*.default/user.js")
	os.system("killall firefox; firefox")

nextq()

if prompt("Install or purge mySQL"):
	os.system("sudo apt-get -y install mysql-server")
	#Disable remote access
	os.system("sudo sed -i '/bind-address/ c\bind-address = 127.0.0.1' /etc/mysql/my.cnf; sudo service mysql restart")
else:
	os.system("sudo apt-get -y purge mysql*")

nextq()

#Checks open ports
if prompt("check open ports"):
	os.system("netstat -anpt")

#Locates netcat
os.system("whereis nc > ~/Desktop/scrptlog/ncoutput.txt")

print("\nDon't forget to look at the checklists!")
print("http://bit.ly/U14Checklist\n")

print("Quick reminders:\n\tAuthorised users/admins\n\tInsecure passwords\n\tRunning services\n\tScary softwares or hacking tools\n\tCheck the desktop for any files saved by the script\n\tCheck for backdoors, whether that be searching for perl files (.pl) or running python scripts (.py)")

os.system("notify-send -i ~/Desktop/ScriptFolder/data/icon.png \"Script Complete\"")

print("\nScript complete...\n")
