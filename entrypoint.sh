#!/bin/ash
ssh-honeypot -r /ssh-honeypot/ssh-honeypot.rsa -p 22 -u nobody
echo "SSH Honeypot is Running..."
exec "$@"
