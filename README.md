# docker-ssh-honey
SSH Honey pot for docker

Using Alpine as base image now to take container from 1GB to around 118MB

Using https://github.com/droberson/ssh-honeypot

FROM THE README

# SSH Honeypot

This program listens for incoming ssh connections and logs the ip
address, username, and password used. This was written to gather
rudimentary intelligence on brute force attacks.


## Syslog facilities

As of version 0.0.5, this supports logging to syslog. This feature
is toggled with the -s flag. It is up to you to configure your
syslog facilities appropriately. This logs to LOG_AUTHPRIV which is
typically /var/log/auth.log. You may want to modify this to use
one of the LOG_LOCAL facilities if you are worried about password
leakage.

This was implemented to aggregate the data from several hosts into
a centralized spot.

## Dropping privileges

As of version 0.0.8, you can drop root privileges of this program
after binding to a privileged port. You can now run this as _nobody_
on port 22 for example instead of root, but have to initially start it
as root:

	$ sudo bin/ssh-honeypot -p 22 -u nobody
	
Beware that this chowns the logfile to the user specified as well.

## Changing the Banner

List available banners

    $ bin/ssh-honeypot -b

Set banner string

    $ bin/ssh-honeypot -b "my banner string"

Set banner by index

    $ bin/ssh-honeypot -i <banner index>

Use a VPS from DO

[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg)](https://www.digitalocean.com/?refcode=e22bbff5f6f1&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)
