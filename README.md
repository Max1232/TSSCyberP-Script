# Interactive Linux Hardening Automation

This repository contains an interactive Python automation script developed for the **CyberPatriot** and **CyberTaipan** national cybersecurity competitions. It is designed to rapidly audit, harden, and secure Ubuntu-based Linux environments against active threats and misconfigurations.

This tool was instrumental in securing a 1st place national finish in the 2019 CyberTaipan competition and a top-50 placement in the 2018–2019 CyberPatriot Semi-Finals.

## ⚠️ Historical Context & Disclaimer
**This script is maintained as a historical artifact of competitive network defense.** 
* It is written in **Python 2.7**, which was standard for the competition images at the time but is now deprecated. 
* It includes competition-specific behaviors (such as logging changed root credentials to `~/Desktop/user.txt` for scoring engine verification) that should **never** be used in a production enterprise environment. 
* Do not run this on a production system without understanding the underlying `bash` and system modifications being executed.

## Features

The script operates as an interactive CLI wizard, prompting the user before executing various hardening modules (via bundled bash scripts and inline commands). Core capabilities include:

### 🛡️ System & Account Hardening
* **User Management:** Locks the `root` account and lists all local users in `/etc/passwd`.
* **Login Security:** Disables guest login and hides user lists via `lightdm.conf`.
* **Filesystem Security:** Disables the mounting of insecure or unnecessary filesystems (`cramfs`, `freevxfs`, `jffs2`, `hfs`, `hfsplus`, `udf`) via `modprobe`.
* **Password Policies:** Executes local PAM and shadow password policy enforcement scripts.

### 🌐 Network & Firewall Defense
* **UFW & iptables:** Installs and configures Uncomplicated Firewall (UFW) with strict default rules (allowing only ports 80/443 outbound) and executes custom `iptables` configurations.
* **Port Auditing:** Dumps `lsof` and `netstat` outputs to a desktop log for rapid visual inspection of listening ports.

### ⚙️ Service Management
* **Unwanted Services:** Actively searches for and purges insecure services (e.g., `telnet`) and flags others for manual review (`samba`, `apache`, `postfix`).
* **Core Services:** Interactively configures or purges SSH, FTP, and MySQL (including binding MySQL to `127.0.0.1` to prevent remote access).
* **Startup Scripts:** Neutralizes malicious persistence by nullifying `/etc/rc.local`.

### 🔍 Forensics & Auditing
* **Media File Sweeps:** Recursively searches the filesystem for prohibited media files (`.mp3`, `.mp4`, `.gif`, etc.) and aggregates their paths into an audit log.
* **Malware Hunting:** Locates potentially malicious binaries like `netcat` (`nc`) and checks `$PATH` variables for tampering.
* **Crontab:** Executes a dedicated script to audit scheduled tasks for persistence mechanisms.

## Prerequisites

To run this script successfully, the following directory structure must be present relative to the script's execution path:

```text
.
├── script.py          # Main interactive Python 2.7 script
├── run/               # Directory containing modular bash scripts
│   ├── updates.sh
│   ├── sysctl.sh
│   ├── badserv.sh
│   ├── ftp.sh
│   ├── ssh.sh
│   ├── crontab.sh
│   ├── passpol.sh
│   ├── scanner.sh
│   ├── iptables.sh
│   └── user.js        # Firefox hardening config
└── data/              # Directory containing configuration templates
    ├── sysctl.conf
    ├── alias.txt
    └── icon.png
```

## Usage

1. Clone the repository and navigate to the root directory.
    
2. Ensure you have superuser privileges.
    
3. Execute the script using Python 2.7:
    

Bash

```
sudo python2 script.py
```

4. Follow the interactive CLI prompts to apply hardening measures step-by-step. All generated audit logs will be saved to `~/Desktop/scrptlog/`.
    

## Author

**Max** - Systems Administrator & CyberTaipan Champion
