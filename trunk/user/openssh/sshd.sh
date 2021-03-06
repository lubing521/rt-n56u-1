#!/bin/sh

dir_storage="/etc/storage"
sshd_config="$dir_storage/sshd_config"

func_create_config()
{
	cat > "$sshd_config" <<EOF

Port 22
AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

### The default requires explicit activation of protocol 1
Protocol 2

### HostKey for protocol version 1
#HostKey /etc/storage/ssh_host_key

### HostKeys for protocol version 2
HostKey /etc/storage/ssh_host_rsa_key
HostKey /etc/storage/ssh_host_dsa_key

### Lifetime and size of ephemeral version 1 server key
#KeyRegenerationInterval 1h
#ServerKeyBits 1024

### Logging
### obsoletes QuietMode and FascistLogging
#SyslogFacility AUTH
#LogLevel INFO

### Authentication:
LoginGraceTime 1m
PermitRootLogin yes
#StrictModes yes
MaxAuthTries 3
MaxSessions 10

#RSAAuthentication yes
#PubkeyAuthentication yes

### The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
### but this is overridden so installations will only check .ssh/authorized_keys
AuthorizedKeysFile	.ssh/authorized_keys

### For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#RhostsRSAAuthentication no
### similar for protocol version 2
#HostbasedAuthentication no
### Change to yes if you don't trust ~/.ssh/known_hosts for
### RhostsRSAAuthentication and HostbasedAuthentication
#IgnoreUserKnownHosts no
### Don't read the user's ~/.rhosts and ~/.shosts files
#IgnoreRhosts yes

### To disable tunneled clear text passwords, change to no here!
#PasswordAuthentication yes
PermitEmptyPasswords no

### Change to no to disable s/key passwords
#ChallengeResponseAuthentication yes

#AllowAgentForwarding yes
#AllowTcpForwarding yes
#GatewayPorts no
#X11Forwarding no
#X11DisplayOffset 10
#X11UseLocalhost yes
#PrintMotd yes
#PrintLastLog yes
#TCPKeepAlive yes
#UseLogin no
#PermitUserEnvironment no
#Compression delayed
#ClientAliveInterval 0
#ClientAliveCountMax 3
UseDNS no
PidFile /var/run/sshd.pid
#MaxStartups 10
#PermitTunnel no
#ChrootDirectory none

### no default banner path
#Banner none

### override default of no subsystems
Subsystem	sftp	/usr/libexec/sftp-server

EOF
	chmod 644 "$sshd_config"
}

func_createkeys()
{
	[ ! -d "$dir_storage" ] && mkdir -p "$dir_storage"
	rm -f "$dir_storage/ssh_host_rsa_key"
	rm -f "$dir_storage/ssh_host_dsa_key"
	/usr/bin/ssh-keygen -t rsa -f "$dir_storage/ssh_host_rsa_key" -N ''
	/usr/bin/ssh-keygen -t dsa -f "$dir_storage/ssh_host_dsa_key" -N ''
}

func_start()
{
	[ ! -d "$dir_storage" ] && mkdir -p $dir_storage
	
	if [ ! -f "$dir_storage/ssh_host_rsa_key" ] || [ ! -f "$dir_storage/ssh_host_dsa_key" ] ; then
		func_createkeys
	fi
	
	if [ ! -f "$sshd_config" ] ; then
		func_create_config
	fi
	
	mkdir -p /var/empty
	chmod 700 /var/empty
	touch /var/run/utmp
	
	if [ -n "$1" ] ; then
		/usr/sbin/sshd -f $sshd_config -o PasswordAuthentication=no
	else
		/usr/sbin/sshd -f $sshd_config
	fi
}

func_stop()
{
	killall -q sshd
}

case "$1" in
start)
	func_start $2
	;;
stop)
	func_stop
	;;
newkeys)
	func_createkeys
	;;
*)
	echo "Usage: $0 {start|stop|newkeys}"
	exit 1
	;;
esac

exit 0
