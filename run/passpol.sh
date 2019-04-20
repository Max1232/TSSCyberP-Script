#!/bin/bash

#Password Policies
cat << EOF > /etc/pam.d/common-password
password    [success=1 default=ignore]	pam_unix.so obscure sha512 remember=5 minlen=8 ocredit = -1 decredit = -1 lcredit = -1 ucredit = -1
password	requisite			pam_deny.so
password	required			pam_permit.so
password	optional	pam_gnome_keyring.so
EOF

cat << EOF > /etc/login.defs
FAILLOG_ENAB		yes
LOG_UNKFAIL_ENAB	no
LOG_OK_LOGINS		no
SYSLOG_SU_ENAB		yes
SYSLOG_SG_ENAB		yes
FTMP_FILE	/var/log/btmp
SU_NAME		su
HUSHLOGIN_FILE	.hushlogin
ENV_SUPATH	PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV_PATH	PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
TTYGROUP	tty
TTYPERM		0600
ERASECHAR	0177
KILLCHAR	025
UMASK		022
PASS_MAX_DAYS	30
PASS_MIN_DAYS	10
PASS_WARN_AGE	7
UID_MIN			 1000
UID_MAX			60000
GID_MIN			 1000
GID_MAX			60000
LOGIN_RETRIES		5
LOGIN_TIMEOUT		60
CHFN_RESTRICT		rwh
DEFAULT_HOME	yes
USERGROUPS_ENAB yes
ENCRYPT_METHOD SHA512
EOF

notify-send -i ~/Desktop/ScriptFolder/data/icon.png "Script Checkpoint" "Password Pols updated"
